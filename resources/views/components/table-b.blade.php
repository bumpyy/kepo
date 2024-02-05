@props(['datas' => []])

<div>
    <h2>Table B</h2>
    @if ($datas)

        @php
            $vendor_list = ['AI', 'BA', 'BO', 'NE', 'O2'];
        @endphp

        <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
            <table class="w-full text-center text-sm rtl:text-right">
                <thead class="border border-black bg-green-400 text-xs uppercase">
                    <tr class="border border-black">
                        <th class="border border-black px-6 py-3" rowspan="2" scope="col">
                            Area
                        </th>
                        <th class="px-6 py-3" colspan="100%" scope="col">
                            Vendor
                        </th>
                    </tr>
                    <tr class="border border-black">
                        @foreach ($vendor_list as $vendor)
                            <th class="border border-black px-6 py-3" scope="col">
                                {{ $vendor }}
                            </th>
                        @endforeach
                    </tr>
                </thead>
                <tbody>
                    @foreach ($datas as $area => $vendors)
                        <tr class="border border-black">
                            <th class="whitespace-nowrap px-6 py-4 font-medium" scope="row">
                                {{ $area }}
                            </th>

                            @foreach ($vendor_list as $vendor)
                                <td class="border border-black px-6 py-4">
                                    @if (count($vendors[$vendor]) > 0)
                                        {{ count($vendors[$vendor]) }}
                                    @endif
                                </td>
                            @endforeach

                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    @endif
</div>
