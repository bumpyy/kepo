@props(['datas' => []])

<div>
    <h2>Table A</h2>
    @if ($datas)
        <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
            <table class="w-full text-center text-sm rtl:text-right">
                <thead class="border border-black bg-green-400 text-xs uppercase">
                    <tr>
                        <th class="border border-black px-6 py-3" scope="col">
                            Area
                        </th>
                        <th class="border border-black px-6 py-3" scope="col">
                            Vendor
                        </th>
                        <th class="border border-black px-6 py-3" scope="col">
                            Jumlah Task
                        </th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($datas as $area => $vendors)
                        @foreach ($vendors as $vendor => $vendor_data)
                            @if (count($vendor_data) > 0)
                                <tr class="border border-black">
                                    <th class="whitespace-nowrap border border-black px-6 py-4 font-medium"
                                        scope="row">
                                        {{ $area }}
                                    </th>
                                    <td class="border border-black px-6 py-4">
                                        {{ $vendor }}
                                    </td>
                                    <td class="border border-black px-6 py-4">
                                        {{ count($vendor_data) }}
                                    </td>
                                </tr>
                            @endif
                        @endforeach
                    @endforeach
                </tbody>
            </table>
        </div>
    @endif
</div>
