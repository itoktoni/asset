<?php

namespace Tests\Browser;

use Laravel\Dusk\Browser;
use Tests\DuskTestCase;

class AspakLoginTestBackup extends DuskTestCase
{
    protected $aspakUrl = 'https://aspak.kemkes.go.id/aplikasi/site/index';
    protected $username = '1203066';
    protected $password = 'Padang123';

    public function test_login_to_aspak(): void
    {
        $this->browse(function (Browser $browser) {
            $browser->visit($this->aspakUrl)
                ->waitFor('input[name="LoginForm[username]"]', 10)
                ->type('input[name="LoginForm[username]"]', $this->username)
                ->type('input[name="LoginForm[password]"]', $this->password)
                ->press('Sign In')
                ->pause(3000)
                ->screenshot('aspak-after-login');
        });
    }

    public function test_navigate_and_add_alat(): void
    {
        $this->browse(function (Browser $browser) {
            // Login
            $browser->visit($this->aspakUrl)
                ->waitFor('input[name="LoginForm[username]"]', 10)
                ->type('input[name="LoginForm[username]"]', $this->username)
                ->type('input[name="LoginForm[password]"]', $this->password)
                ->press('Sign In')
                ->pause(5000);

            // Navigate ke halaman IPAL
            $browser->visit('https://aspak.kemkes.go.id/aplikasi/nualatrs/index/1231?if=39953#abc')
                ->pause(8000);

            // Kirim data langsung via AJAX (bypass UI validation bug)
            $browser->script("
                window._saveResult = null;
                var URL_add = $('.var-URL_add').attr('data-value');
                var prefix = $('.var-OBJECTMODELNAME').attr('data-value');
                var data = {};

                data[prefix + '[id_alat]'] = '6405';
                data[prefix + '[id_rs]'] = '39953';
                data[prefix + '[id_kategori]'] = '1231';
                data[prefix + '[id_ruangan]'] = '2312121';
                data[prefix + '[no_seri]'] = 'SN-IPAL-' + Date.now();
                data[prefix + '[merk]'] = 'IPAL';
                data[prefix + '[tipe]'] = '001';
                data[prefix + '[berfungsi]'] = '1';
                data[prefix + '[produk]'] = '1';
                data[prefix + '[thn_pengadaan]'] = '2024';
                data[prefix + '[pendanaan]'] = '0';
                data[prefix + '[harga]'] = '150000000';
                data[prefix + '[power_jenis]'] = '0';
                data[prefix + '[power_daya]'] = '500';
                data[prefix + '[lokasi]'] = 'Gedung Utama Lantai 1';
                data[prefix + '[vendor]'] = 'PT Alat Kesehatan Indonesia';
                data[prefix + '[akl_akd]'] = 'AKL-2024-00123';
                data[prefix + '[keterangan]'] = 'IPAL pengadaan tahun 2024';
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
                ->screenshot('aspak-after-save');

            $saveResult = $browser->script('return window._saveResult;');

            $status = false;
            if (is_array($saveResult)) {
                $inner = $saveResult[0] ?? $saveResult;
                if (is_array($inner) && isset($inner['status'])) {
                    $status = $inner['status'] === true;
                } elseif (isset($saveResult['status'])) {
                    $status = $saveResult['status'] === true;
                }
            }

            $browser->screenshot('aspak-after-save');
            $this->assertTrue($status, 'Save failed: ' . json_encode($saveResult));
        });
    }
}
