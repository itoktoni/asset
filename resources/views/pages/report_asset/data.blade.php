<table border="0" class="header">
	<tr>
		<td></td>
		<td colspan="6">
			<h3>
				<b>Report Asset</b>
			</h3>
		</td>
		<td rowspan="3">
			<x-logo/>
		</td>
	</tr>
	<tr>
		<td></td>
		<td colspan="10">
			<h3>
				laporan asset
			</h3>
		</td>
	</tr>
	<tr>
		<td></td>
		<td colspan="10">
			<h3>
				Tanggal Register : {{ formatDate(request()->get('start_date')) }} - {{ formatDate(request()->get('end_date')) }}
			</h3>
		</td>
	</tr>
</table>

<div class="table-responsive" id="table_data">
	<table id="export" border="1" style="border-collapse: collapse !important; border-spacing: 0 !important;"
		class="table table-bordered table-striped table-responsive-stack">
		<thead>
			<tr>
				<th width="1">No. </th>
				<th>NOMENKLATUR</th>
				<th>SERIAL NUMBER</th>
				<th>KODE ASSET</th>
				<th>KODE AKL / AKD</th>
				<th>NAMA ASSET</th>
				<th>BRAND</th>
				<th>MODEL/TIPE</th>
				<th>RUANGAN</th>
				<th>FULL NAME ASSET</th>
				<th>TANGGAL DIAKUI</th>
				<th>STATUS</th>
				<th>HARGA</th>
				<th>PENDANAAN</th>
				<th>DISTRIBUTOR</th>
			</tr>
		</thead>
		<tbody>
			@forelse($data as $table)
			<tr>
				<td>{{ $loop->iteration }}</td>
				<td>{{ $table->penamaan_code_nomenklatur ?? '' }}</td>
				<td>{{ $table->field_serial_number }}</td>
				<td>{{ $table->field_code }}</td>
				<td>{{ $table->field_akl_akd }}</td>
				<td>{{ $table->penamaan_nama }}</td>
				<td>{{ $table->brand_nama }}</td>
				<td>{{ $table->model_nama }}</td>
				<td>{{ $table->lokasi_gabungan ?? '' }}</td>
				<td>{{ $table->field_name }}</td>
				<td>{{ formatDate($table->field_tanggal_kunjungan) }}</td>
				<td>{{ $table->field_status ?? '' }}</td>
				<td>{{ $table->field_harga ?? '' }}</td>
				<td>{{ $table->field_pendanaan ?? '' }}</td>
				<td>{{ $table->vendor_nama ?? '' }}</td>
			</tr>
			@empty
			@endforelse

		</tbody>
	</table>
</div>

<table class="footer">
	<tr>
		<td colspan="2" class="print-date">{{ env('APP_LOCATION') }}, {{ date('d F Y') }}</td>
	</tr>
	<tr>
		<td colspan="2" class="print-person">{{ auth()->user()->name ?? '' }}</td>
	</tr>
</table>