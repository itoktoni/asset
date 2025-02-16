<x-layout>

    <div class="container-fluid">
        <!-- Account page navigation-->

        <div class="row">
            <div class="col-xl-12">
                <form id="form" method="POST" action="{{ route('updateProfile') }}"
                    class="form-submit needs-validation">
                    @csrf
                    <x-card label="Profile Information">

                        @bind($model)
                            <x-form-input col="6" name="name" />
                            <x-form-input col="6" name="username" />
                            <x-form-input col="6" name="phone" />
                            <x-form-input col="6" name="email" />
                            <x-form-input col="6" name="password" type="password" />
                        @endbind

                    </x-card>

                    <div class="page-action">
                        <h5 class="action-container">
                            <div class="button">
                                <div class="button button-action">
                                    <button type="submit" class="btn btn-primary">
                                        Simpan
                                    </button>
                                </div>
                            </div>
                        </h5>
                    </div>

                </form>
            </div>
        </div>
    </div>

</x-layout>
