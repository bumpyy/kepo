<x-app-layout>
    <div class="container mx-auto my-8 flex flex-col gap-8">
        {{-- @dd($hasil_a); --}}

        <x-table-a :datas='$hasil_a' />

        <x-table-b :datas='$hasil_a' />

        <x-table-c :datas='$hasil_c' />

        {!! $chart_a->container() !!}
        {!! $chart_b->container() !!}
        <script src="{{ $chart_a->cdn() }}"></script>
        <script src="{{ $chart_b->cdn() }}"></script>
        {!! $chart_a->script() !!}
        {!! $chart_b->script() !!}
    </div>
</x-app-layout>
