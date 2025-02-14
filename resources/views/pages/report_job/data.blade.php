<table border="0" class="header">
	<tr>
		<td></td>
		<td colspan="6">
			<h3>
				<b>Report Pekerjaan</b>
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
				laporan pekerjaan berdasarkan tanggal register
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
				<th>TIPE</th>
				<th>PELAPOR</th>
				<th>KODE PEKERJAAN</th>
				<th>TANGGAL</th>
				<th>AMBIL</th>
				<th>SELESAI</th>
				<th>NAMA ASSET</th>
				<th>KETERANGAN</th>
				<th>ANALISA</th>
				<th>REKOMENDASI</th>
				<th>KESIMPULAN</th>
			</tr>
		</thead>
		<tbody>
			@forelse($data as $table)
			<tr>
				<td>{{ $loop->iteration }}</td>
				<td>{{ $table->field_type }}</td>
				<td>{{ $table->tiket_pelapor }}</td>
				<td>{{ $table->field_code }}</td>
				<td>{{ formatDate($table->field_tanggal) }}</td>
				<td>{{ formatDate($table->field_picked_at) }}</td>
				<td>{{ formatDate($table->field_finished_at) }}</td>
				<td>{{ $table->field_name }}</td>
				<td>{{ $table->field_description }}</td>
				<td>{{ $table->field_analisa }}</td>
				<td>{{ $table->has_saran->field_name ?? '' }}</td>
				<td>{{ $table->field_kesimpulan }}</td>
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