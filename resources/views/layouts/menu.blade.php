<nav class="navbar navbar-default" role="navigation" data-spy="affix" data-offset-top="153">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="navbar">
      <ul class="nav navbar-nav">
        <li><a href="{{url('/')}}">Trang Chủ</a></li>
        <?php
          $categories = DB::table('categories')->get();
        ?>
        @foreach($categories as $category)
        <li><a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">{!! $category->name !!} <span class="caret"></span></a>

            <?php
              $trademarks = DB::table('trademarks')->where('category_id',$category->id)->get();
            ?>
              @if(count($trademarks)>0)
              <ul class="dropdown-menu">
                @foreach($trademarks as $trademark)
                <li><a href="{{route('trademarks',$trademark->id)}}">{{$trademark->name}}</a></li>
                <li role="separator" class="divider"></li>
                @endforeach
              </ul>
              @endif
        </li>
        @endforeach
        <li><a href="#">Giới Thiệu</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
