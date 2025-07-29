<div class="form-group mb-4 {{ $col }} {{ $errors->has($name) ? 'has-error' : '' }}">
    <x-form-label :label="$label" :for="$attributes->get('id') ?: $id()" />
        <textarea
        @if($isWired())
            wire:model{!! $wireModifier() !!}="{{ $name }}"
        @endif

        name="{{ $name }}"

        @if($label && !$attributes->get('id'))
            id="{{ $id() }}"
        @endif

        rows="{{ $rows }}"

        {!! $attributes->merge(['class' => 'form-control ']) !!}>@unless($isWired()){!! $value !!}@endunless</textarea>

</div>