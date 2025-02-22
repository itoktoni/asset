<table border="0" class="header">
	<tr>
		<td></td>
		<td colspan="6">
			<h3>
				<b>Report Jadwal Kalibrasi</b>
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
				laporan pekerjaan berdasarkan jadwal
			</h3>
		</td>
	</tr>
	<tr>
		<td></td>
		<td colspan="10">
			<h3>
				Tanggal : {{ formatDate(request()->get('start_date')) }} - {{ formatDate(request()->get('end_date')) }}
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
				<th>NAMA ASSET</th>
				<th>RUANGAN</th>
				<th>KALIBRASI TERAKHIR</th>
				<th>KALIBRASI SELANJUTNYA</th>
				<th>PELAKSANA</th>
				<th>STATUS</th>
			</tr>
		</thead>
		<tbody>
			@forelse($data as $table)
			<tr>
				<td>{{ $loop->iteration }}</td>
				<td>{{ $table->field_name }}</td>
				<td>{{ $table->lokasi_gabungan ?? '' }}</td>
				<td>{{ formatDate($table->field_tanggal_expired) }}</td>
				<td>{{ formatDate($table->field_next_expired) }}</td>
				<td>{{ $table->vendor_nama ?? '' }}</td>
				<td>{{ statusExpired($table->field_next_expired) }}</td>
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