<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="background: #222;margin-bottom: 0;">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/PhoneShop/public/admin/dashboard"> <span style="color: #2ea2ff; font-family: 'Montserrat';    font-size: 24px;
">A ĐẠT</span> <span>STORE</span> </a>
    </div>
    <!-- /.navbar-header -->

    <ul class="nav navbar-top-links navbar-right">
        <!-- /.dropdown -->
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                @if(Auth::check())
                <li><a href="javascript:void(0)"><i class="fa fa-user fa-fw"></i> {{ Auth::user()->email }}</a>
                </li>
                <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                </li>
                <li class="divider"></li>
                <li><a href="{{route('getLogout')}}"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                </li>
                @endif
            </ul>
            <!-- /.dropdown-user -->
        </li>
        <!-- /.dropdown -->
    </ul>
    <!-- /.navbar-top-links -->

    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
                <li style="padding: 25px; font-size: 18px; ">
                    <a href="{{ url('admin/dashboard') }}"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                </li>
                <li style="padding: 25px; font-size: 18px; ">
                    <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Category<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="{{route('cate.getlist')}}">List Category</a>
                        </li>
                        <li>
                            <a href="{{route('trademark.getlist')}}">List Manufacture</a>
                        </li>
                    </ul>
                    <!-- /.nav-second-level -->
                </li>
                <li style="padding: 25px; font-size: 18px; ">
                    <a href="#"><i class="fa fa-cube fa-fw"></i> Product<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="{{route('product.getlist')}}">List Product</a>
                        </li>
                        <li>
                            <a href="{{route('product.getadd')}}">Add Product</a>
                        </li>
                    </ul>
                    <!-- /.nav-second-level -->
                </li>
                <li style="padding: 25px; font-size: 18px; ">
                    <a href="{{route('order.getlist')}}"><i class="fa fa-dashboard fa-fw"></i> Order</a>
                </li>
                <li style="padding: 25px; font-size: 18px; ">
                    <a href="{{route('user.getlist')}}"><i class="fa fa-users fa-fw"></i> User</span></a>

                    <!-- /.nav-second-level -->
                </li  >
                <li style="padding: 25px; font-size: 18px; ">
                    <a href="{{route('comment.getlist')}}"><i class="fa fa-comment"></i> Comment</span></a>

                    <!-- /.nav-second-level -->
                </li  >
                <li style="padding: 25px; font-size: 18px; " >
                <a href="{{route('getLogout')}}"><i class="fa fa-power-off"></i> Logout</span></a>
                </li>
            </ul>
        </div>
        <!-- /.sidebar-collapse -->
    </div>
</nav>
