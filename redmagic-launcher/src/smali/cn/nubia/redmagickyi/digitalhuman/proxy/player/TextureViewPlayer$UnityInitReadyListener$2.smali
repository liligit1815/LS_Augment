.class Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener$2;
.super Landroid/os/Handler;
.source "TextureViewPlayer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->queryUnityNotBlack()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;


# direct methods
.method constructor <init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener$2;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4

    .line 1
    const-wide/16 v0, 0x32

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    :try_start_0
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener$2;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;

    .line 5
    .line 6
    invoke-static {v2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->access$500(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;)Ljava/util/concurrent/atomic/AtomicReference;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    iget-object v3, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener$2;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;

    .line 11
    .line 12
    iget-object v3, v3, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;

    .line 13
    .line 14
    invoke-static {v3}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->access$400(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;)Landroid/view/TextureView;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-virtual {v3}, Landroid/view/TextureView;->getBitmap()Landroid/graphics/Bitmap;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener$2;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;

    .line 26
    .line 27
    invoke-static {v2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->access$600(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;)Landroid/os/Handler;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    if-eqz v2, :cond_0

    .line 32
    .line 33
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener$2;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;

    .line 34
    .line 35
    invoke-static {v2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->access$500(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;)Ljava/util/concurrent/atomic/AtomicReference;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    if-eqz v2, :cond_0

    .line 44
    .line 45
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener$2;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;

    .line 46
    .line 47
    invoke-static {v2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->access$500(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;)Ljava/util/concurrent/atomic/AtomicReference;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    check-cast v2, Landroid/graphics/Bitmap;

    .line 56
    .line 57
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    if-nez v2, :cond_0

    .line 62
    .line 63
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener$2;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;

    .line 64
    .line 65
    invoke-static {v2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->access$500(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;)Ljava/util/concurrent/atomic/AtomicReference;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    check-cast v2, Landroid/graphics/Bitmap;

    .line 74
    .line 75
    invoke-virtual {v2, p1, p1}, Landroid/graphics/Bitmap;->getPixel(II)I

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    if-nez v2, :cond_0

    .line 80
    .line 81
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener$2;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;

    .line 82
    .line 83
    iget-object v2, v2, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;

    .line 84
    .line 85
    iget-object v2, v2, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;->callback:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;

    .line 86
    .line 87
    invoke-interface {v2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;->setModelRendered()V

    .line 88
    .line 89
    .line 90
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener$2;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;

    .line 91
    .line 92
    invoke-static {v2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->access$700(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;)V

    .line 93
    .line 94
    .line 95
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener$2;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;

    .line 96
    .line 97
    invoke-static {v2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->access$800(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 98
    .line 99
    .line 100
    goto :goto_0

    .line 101
    :catchall_0
    move-exception v2

    .line 102
    goto :goto_1

    .line 103
    :cond_0
    :goto_0
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener$2;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;

    .line 104
    .line 105
    invoke-static {v2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->access$600(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;)Landroid/os/Handler;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    if-eqz v2, :cond_2

    .line 110
    .line 111
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener$2;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;

    .line 112
    .line 113
    invoke-static {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->access$600(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;)Landroid/os/Handler;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {p0, p1, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :goto_1
    iget-object v3, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener$2;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;

    .line 122
    .line 123
    invoke-static {v3}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->access$600(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;)Landroid/os/Handler;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    if-eqz v3, :cond_1

    .line 128
    .line 129
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener$2;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;

    .line 130
    .line 131
    invoke-static {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->access$600(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;)Landroid/os/Handler;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-virtual {p0, p1, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 136
    .line 137
    .line 138
    :cond_1
    throw v2

    .line 139
    :catch_0
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener$2;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;

    .line 140
    .line 141
    invoke-static {v2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->access$600(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;)Landroid/os/Handler;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    if-eqz v2, :cond_2

    .line 146
    .line 147
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener$2;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;

    .line 148
    .line 149
    invoke-static {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->access$600(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;)Landroid/os/Handler;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-virtual {p0, p1, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 154
    .line 155
    .line 156
    :cond_2
    return-void
.end method
