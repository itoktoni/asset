<?php

namespace Tests\Browser;

use App\Dao\Models\Asset;
use Laravel\Dusk\Browser;
use Tests\DuskTestCase;

class AspakLoginTest extends DuskTestCase
{
    protected $aspakUrl = 'https://aspak.kemkes.go.id/aplikasi/site/index';
    protected $username = '1203066';
    protected $password = 'Padang123';

    protected function login(Browser $browser): void
    {
        $browser->visit($this->aspakUrl)
            ->waitFor('input[name="LoginForm[username]"]', 10)
            ->type('input[name="LoginForm[username]"]', $this->username)
            ->type('input[name="LoginForm[password]"]', $this->password)
            ->press('Sign In')
            ->pause(5000);
    }

    protected function mapPendanaanToAspak($pendanaan): string
    {
        return match ($pendanaan) {
            'APBN' => '0',
            'APBD' => '1',
            'Hibah', 'Pemberian' => '2',
            'KSO', 'Pinjam' => '3',
            'BLU', 'BLUD' => '4',
            'JKN' => '5',
            'DAK' => '6',
            'Swasta', 'Swadana' => '8',
            default => '0',
        };
    }

    protected function mapStatusToAspak($status): string
    {
        return match (strtoupper($status ?? '')) {
            'BAIK', 'BERFUNGSI' => '1',
            'RUSAK' => '0',
            'TIDAK BEROPERASI' => '2',
            default => '1',
        };
    }

    public function test_login_to_aspak(): void
    {
        $this->browse(function (Browser $browser) {
            $this->login($browser);
            $browser->screenshot('aspak-after-login');
        });
    }

    public function test_sync_asset_to_aspak(): void
    {
        $asset = Asset::find(50);
        $this->assertNotNull($asset, 'Asset ID 50 not found');

        $this->browse(function (Browser $browser) use ($asset) {
            // Login
            $this->login($browser);

            // Navigate ke halaman IPAL
            $browser->visit('https://aspak.kemkes.go.id/aplikasi/nualatrs/index/1231?if=39953#abc')
                ->pause(8000);

            // Map data asset ke format ASPAK
            $noSeri = $asset->asset_serial_number ?: 'SN-' . $asset->asset_id . '-' . time();
            $berfungsi = $this->mapStatusToAspak($asset->asset_status);
            $pendanaan = $this->mapPendanaanToAspak($asset->asset_pendanaan);
            $harga = $asset->asset_harga_perolehan ?: '0';
            $keterangan = $asset->asset_keterangan ?: $asset->asset_nama;
            $thnPengadaan = $asset->asset_tahun_pengadaan ?: date('Y');
            $lokasi = $asset->asset_id_lokasi ? "Lokasi #{$asset->asset_id_lokasi}" : '';
            $aklAkd = $asset->asset_akl_akd ?: '';

            $noSeriJs = addslashes($noSeri);
            $keteranganJs = addslashes($keterangan);
            $lokasiJs = addslashes($lokasi);
            $aklAkdJs = addslashes($aklAkd);

            $browser->script("
                window._saveResult = null;
                var URL_add = $('.var-URL_add').attr('data-value');
                var prefix = $('.var-OBJECTMODELNAME').attr('data-value');
                var data = {};

                data[prefix + '[id_alat]'] = '6405';
                data[prefix + '[id_rs]'] = '39953';
                data[prefix + '[id_kategori]'] = '1231';
                data[prefix + '[id_ruangan]'] = '2312121';
                data[prefix + '[no_seri]'] = '{$noSeriJs}';
                data[prefix + '[merk]'] = 'IPAL';
                data[prefix + '[tipe]'] = '001';
                data[prefix + '[berfungsi]'] = '{$berfungsi}';
                data[prefix + '[produk]'] = '1';
                data[prefix + '[thn_pengadaan]'] = '{$thnPengadaan}';
                data[prefix + '[pendanaan]'] = '{$pendanaan}';
                data[prefix + '[harga]'] = '{$harga}';
                data[prefix + '[power_jenis]'] = '0';
                data[prefix + '[power_daya]'] = '500';
                data[prefix + '[lokasi]'] = '{$lokasiJs}';
                data[prefix + '[vendor]'] = '';
                data[prefix + '[akl_akd]'] = '{$aklAkdJs}';
                data[prefix + '[keterangan]'] = '{$keteranganJs}';
                data[prefix + '[kfa_code]'] = '0';
                data['StoFileModel[id_owner]'] = '39953';
                data['StoFileModel[ruangan]'] = 'default';

                $.ajax({
                    url: URL_add,
                    data: data,
                    dataType: 'JSON',
                    type: 'POST',
                    success: function (D) {
                        window._saveResult = D;
                        if (D.status) {
                            var body = $('tbody.j-resume-alat');
                            var exist = $('.j-record-cum[data-ida=' + D.data.ida + ']');
                            if (exist.length > 0) {
                                $(exist).children('.j-jumlah').html(D.data.jumlah);
                                $(exist).children('.j-ttsd').html(D.data.ttsd);
                            } else {
                                $(body).append(D.data.html);
                            }
                        }
                    },
                    error: function (xhr, status, error) {
                        window._saveResult = { error: error, status: false };
                    }
                });
            ");

            $browser->pause(10000)
                ->screenshot('aspak-sync-result');

            $saveResult = $browser->script('return window._saveResult;');

            $status = false;
            if (is_array($saveResult)) {
                $inner = $saveResult[0] ?? $saveResult;
                if (is_array($inner) && isset($inner['status'])) {
                    $status = $inner['status'] === true;
                }
            }

            $this->assertTrue($status, 'Sync failed: ' . json_encode($saveResult));
        });
    }
}
