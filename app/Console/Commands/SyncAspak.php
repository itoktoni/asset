<?php

namespace App\Console\Commands;

use App\Dao\Models\Asset;
use App\Dao\Models\Lokasi;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Http;

class SyncAspak extends Command
{
    protected $signature = 'sync:aspak {asset_id : ID asset yang akan di-sync}';

    protected $description = 'Sync data asset ke ASPAK Kemkes';

    protected function login(): ?string
    {
        $response = Http::asForm()->post(config('aspak.base_url') . '/site/index', [
            'LoginForm[username]' => config('aspak.username'),
            'LoginForm[password]' => config('aspak.password'),
        ]);

        if ($response->successful()) {
            $cookies = $response->cookies();
            foreach ($cookies as $cookie) {
                if ($cookie->getName() === 'PHPSESSID') {
                    return $cookie->getValue();
                }
            }
        }

        return null;
    }

    protected function mapPendanaan(?string $pendanaan): string
    {
        return match ($pendanaan) {
            'APBN' => '0',
            'APBD' => '1',
            'BLU' => '4',
            'Mandiri' => '8',
            default => '0',
        };
    }

    protected function mapStatus(?string $status): string
    {
        return match (strtoupper($status ?? '')) {
            'BAIK', 'BERFUNGSI' => '1',
            'RUSAK' => '0',
            'TIDAK BEROPERASI' => '2',
            default => '1',
        };
    }

    public function handle()
    {
        $assetId = $this->argument('asset_id');
        $asset = Asset::find($assetId);

        if (!$asset) {
            $this->error("Asset ID {$assetId} tidak ditemukan.");
            return 1;
        }

        $this->info("Sync asset: {$asset->asset_nama} (ID: {$assetId})");

        $lokasi = Lokasi::find($asset->asset_id_lokasi);

        if (!$lokasi) {
            $this->error("Lokasi untuk asset ID {$assetId} tidak ditemukan (asset_id_lokasi: {$asset->asset_id_lokasi}).");
            return 1;
        }

        $idKategori = $lokasi->lokasi_code_level;
        $namaLokasi = $lokasi->lokasi_gabungan;

        if (empty($idKategori)) {
            $this->error("lokasi_code_level kosong untuk lokasi ID {$lokasi->lokasi_id} ({$namaLokasi}).");
            return 1;
        }

        $this->info("Lokasi: {$namaLokasi} | Kode Level (id_kategori): {$idKategori}");

        $this->line('Login ke ASPAK...');
        $sessionId = $this->login();

        if (!$sessionId) {
            $this->error('Gagal login ke ASPAK.');
            return 1;
        }

        $this->info('Login berhasil.');

        $noSeri = $asset->asset_serial_number ?: 'SN-' . $asset->asset_id . '-' . time();
        $berfungsi = $this->mapStatus($asset->asset_status);
        $pendanaan = $this->mapPendanaan($asset->asset_pendanaan);
        $harga = $asset->asset_harga_perolehan ?: '0';
        $keterangan = $asset->asset_keterangan ?: $asset->asset_nama;
        $thnPengadaan = $asset->asset_tahun_pengadaan ?: date('Y');
        $aklAkd = $asset->asset_akl_akd ?: '';

        $this->line('Mengirim data ke ASPAK...');

        $response = Http::asForm()
            ->withHeaders([
                'Cookie' => "PHPSESSID={$sessionId}",
            ])
            ->post(config('aspak.base_url') . '/nualatrs/add?if=' . config('aspak.id_rs'), [
                'AspakRsAlatModel[id_alat]' => '6405',
                'AspakRsAlatModel[id_rs]' => config('aspak.id_rs'),
                'AspakRsAlatModel[id_kategori]' => $idKategori,
                'AspakRsAlatModel[id_ruangan]' => config('aspak.id_ruangan'),
                'AspakRsAlatModel[no_seri]' => $noSeri,
                'AspakRsAlatModel[merk]' => 'IPAL',
                'AspakRsAlatModel[tipe]' => '001',
                'AspakRsAlatModel[berfungsi]' => $berfungsi,
                'AspakRsAlatModel[produk]' => '1',
                'AspakRsAlatModel[thn_pengadaan]' => $thnPengadaan,
                'AspakRsAlatModel[pendanaan]' => $pendanaan,
                'AspakRsAlatModel[harga]' => $harga,
                'AspakRsAlatModel[power_jenis]' => '0',
                'AspakRsAlatModel[power_daya]' => '500',
                'AspakRsAlatModel[lokasi]' => $namaLokasi,
                'AspakRsAlatModel[vendor]' => '',
                'AspakRsAlatModel[akl_akd]' => $aklAkd,
                'AspakRsAlatModel[keterangan]' => $keterangan,
                'AspakRsAlatModel[kfa_code]' => '0',
                'StoFileModel[id_owner]' => config('aspak.id_rs'),
                'StoFileModel[ruangan]' => 'default',
            ]);

        $result = $response->json();

        if ($response->successful() && isset($result['status']) && $result['status'] === true) {
            $this->info("Sync berhasil! Jumlah IPAL: {$result['data']['jumlah']}");
            return 0;
        }

        $msg = $result['msg'] ?? $response->body();
        $this->error("Sync gagal: {$msg}");
        return 1;
    }
}
