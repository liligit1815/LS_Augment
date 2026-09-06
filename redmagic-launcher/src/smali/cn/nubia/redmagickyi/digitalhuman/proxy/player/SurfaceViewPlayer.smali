.class public Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;
.super Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;
.source "SurfaceViewPlayer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;,
        Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$ProxySurfaceCallback;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Client-SurfaceViewPlayer"


# instance fields
.field private backgroundView:Landroid/view/SurfaceView;

.field private myView:Landroid/view/ViewGroup;

.field private parentView:Landroid/view/View;

.field private scene:Ljava/lang/Integer;

.field private thumbnailView:Landroid/view/SurfaceView;

.field private unityInitReadyListener:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;

.field private unityView:Landroid/view/SurfaceView;


# direct methods
.method public constructor <init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;-><init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-direct {p1, p0, v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;-><init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$1;)V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->unityInitReadyListener:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;

    .line 11
    .line 12
    const-string p0, "Client-SurfaceViewPlayer"

    .line 13
    .line 14
    const-string p1, "create player"

    .line 15
    .line 16
    invoke-static {p0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method static synthetic access$100(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->checkIfModelRendered()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic access$200(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->scene:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic access$300(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;)Landroid/view/SurfaceView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->thumbnailView:Landroid/view/SurfaceView;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic access$400(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;)Landroid/view/SurfaceView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->unityView:Landroid/view/SurfaceView;

    .line 2
    .line 3
    return-object p0
.end method

.method private checkIfModelRendered()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->scene:Ljava/lang/Integer;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->onSwitchScene(Ljava/lang/Integer;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->unityInitReadyListener:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;->isModelRendered()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->thumbnailView:Landroid/view/SurfaceView;

    .line 16
    .line 17
    if-eqz v0, :cond_3

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setAlpha(F)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->thumbnailView:Landroid/view/SurfaceView;

    .line 23
    .line 24
    const/16 v0, 0x8

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/SurfaceView;->setVisibility(I)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->thumbnailView:Landroid/view/SurfaceView;

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    const/high16 v2, 0x3f800000    # 1.0f

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Landroid/view/SurfaceView;->setAlpha(F)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->thumbnailView:Landroid/view/SurfaceView;

    .line 40
    .line 41
    const/4 v2, 0x0

    .line 42
    invoke-virtual {v0, v2}, Landroid/view/SurfaceView;->setVisibility(I)V

    .line 43
    .line 44
    .line 45
    :cond_1
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->unityView:Landroid/view/SurfaceView;

    .line 46
    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setScaleX(F)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->unityView:Landroid/view/SurfaceView;

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setScaleY(F)V

    .line 55
    .line 56
    .line 57
    :cond_2
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->unityInitReadyListener:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;

    .line 58
    .line 59
    invoke-virtual {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;->isModelReady()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_3

    .line 64
    .line 65
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->onModelReady()V

    .line 66
    .line 67
    .line 68
    :cond_3
    return-void
.end method

.method private createSurfaceView(Landroid/content/Context;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;)Landroid/view/SurfaceView;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "createSurfaceView, type: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "Client-SurfaceViewPlayer"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    new-instance v0, Landroid/view/SurfaceView;

    .line 24
    .line 25
    invoke-direct {v0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 26
    .line 27
    .line 28
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 29
    .line 30
    const/4 v1, 0x1

    .line 31
    invoke-direct {p1, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 32
    .line 33
    .line 34
    const/16 v1, 0x11

    .line 35
    .line 36
    iput v1, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 37
    .line 38
    invoke-virtual {v0, p1}, Landroid/view/SurfaceView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const/4 v1, -0x3

    .line 46
    invoke-interface {p1, v1}, Landroid/view/SurfaceHolder;->setFormat(I)V

    .line 47
    .line 48
    .line 49
    new-instance p1, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$ProxySurfaceCallback;

    .line 50
    .line 51
    invoke-direct {p1, p0, p2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$ProxySurfaceCallback;-><init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-interface {p0, p1}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, p1}, Landroid/view/SurfaceView;->setTag(Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    return-object v0
.end method


# virtual methods
.method public bindView(Landroid/view/ViewGroup;Ljava/lang/Boolean;Z)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "bindView, parentView: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, ", isHidden: "

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v1, ", addViewAgin: "

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "Client-SurfaceViewPlayer"

    .line 35
    .line 36
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->parentView:Landroid/view/View;

    .line 40
    .line 41
    if-eq v0, p1, :cond_3

    .line 42
    .line 43
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->parentView:Landroid/view/View;

    .line 44
    .line 45
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 46
    .line 47
    if-nez v0, :cond_0

    .line 48
    .line 49
    new-instance v0, Landroid/widget/FrameLayout;

    .line 50
    .line 51
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 56
    .line 57
    .line 58
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 59
    .line 60
    new-instance v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 61
    .line 62
    const/4 v2, -0x1

    .line 63
    invoke-direct {v1, v2, v2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 67
    .line 68
    .line 69
    :cond_0
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 70
    .line 71
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-gtz v0, :cond_1

    .line 76
    .line 77
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    sget-object v1, Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;->Background:Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;

    .line 82
    .line 83
    invoke-direct {p0, v0, v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->createSurfaceView(Landroid/content/Context;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;)Landroid/view/SurfaceView;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->backgroundView:Landroid/view/SurfaceView;

    .line 88
    .line 89
    iget-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 90
    .line 91
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    sget-object v1, Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;->Thumbnail:Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;

    .line 99
    .line 100
    invoke-direct {p0, v0, v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->createSurfaceView(Landroid/content/Context;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;)Landroid/view/SurfaceView;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->thumbnailView:Landroid/view/SurfaceView;

    .line 105
    .line 106
    iget-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 107
    .line 108
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    sget-object v1, Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;->Unity:Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;

    .line 116
    .line 117
    invoke-direct {p0, v0, v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->createSurfaceView(Landroid/content/Context;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;)Landroid/view/SurfaceView;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->unityView:Landroid/view/SurfaceView;

    .line 122
    .line 123
    iget-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 124
    .line 125
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 126
    .line 127
    .line 128
    invoke-direct {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->checkIfModelRendered()V

    .line 129
    .line 130
    .line 131
    :cond_1
    if-nez p3, :cond_3

    .line 132
    .line 133
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 134
    .line 135
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    if-nez v0, :cond_2

    .line 140
    .line 141
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 142
    .line 143
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 144
    .line 145
    .line 146
    goto :goto_0

    .line 147
    :cond_2
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 148
    .line 149
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    if-eq v0, p1, :cond_3

    .line 154
    .line 155
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 156
    .line 157
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    check-cast v0, Landroid/view/ViewGroup;

    .line 162
    .line 163
    iget-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 164
    .line 165
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 166
    .line 167
    .line 168
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 169
    .line 170
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 171
    .line 172
    .line 173
    :cond_3
    :goto_0
    if-eqz p3, :cond_5

    .line 174
    .line 175
    iget-object p3, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 176
    .line 177
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 178
    .line 179
    .line 180
    iget-object p3, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 181
    .line 182
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 183
    .line 184
    .line 185
    move-result-object p3

    .line 186
    if-nez p3, :cond_4

    .line 187
    .line 188
    iget-object p3, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 189
    .line 190
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 191
    .line 192
    .line 193
    goto :goto_1

    .line 194
    :cond_4
    iget-object p3, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 195
    .line 196
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 197
    .line 198
    .line 199
    move-result-object p3

    .line 200
    if-eq p3, p1, :cond_5

    .line 201
    .line 202
    iget-object p3, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 203
    .line 204
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 205
    .line 206
    .line 207
    move-result-object p3

    .line 208
    check-cast p3, Landroid/view/ViewGroup;

    .line 209
    .line 210
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 211
    .line 212
    invoke-virtual {p3, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 213
    .line 214
    .line 215
    iget-object p3, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 216
    .line 217
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 218
    .line 219
    .line 220
    :cond_5
    :goto_1
    if-eqz p2, :cond_7

    .line 221
    .line 222
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 223
    .line 224
    .line 225
    move-result p1

    .line 226
    if-eqz p1, :cond_6

    .line 227
    .line 228
    goto :goto_2

    .line 229
    :cond_6
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->show()V

    .line 230
    .line 231
    .line 232
    return-void

    .line 233
    :cond_7
    :goto_2
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->hide()V

    .line 234
    .line 235
    .line 236
    return-void
.end method

.method public clearState()V
    .locals 2

    .line 1
    const-string v0, "Client-SurfaceViewPlayer"

    .line 2
    .line 3
    const-string v1, "clearState"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->parentView:Landroid/view/View;

    .line 10
    .line 11
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->unityInitReadyListener:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;->restoreState()V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method

.method public hide()V
    .locals 2

    .line 1
    const-string v0, "Client-SurfaceViewPlayer"

    .line 2
    .line 3
    const-string v1, "hide"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;->callback:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-interface {v0, v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;->setHidden(Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 15
    .line 16
    const/16 v1, 0x8

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->backgroundView:Landroid/view/SurfaceView;

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setVisibility(I)V

    .line 28
    .line 29
    .line 30
    :cond_1
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->thumbnailView:Landroid/view/SurfaceView;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setVisibility(I)V

    .line 35
    .line 36
    .line 37
    :cond_2
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->unityView:Landroid/view/SurfaceView;

    .line 38
    .line 39
    if-eqz p0, :cond_3

    .line 40
    .line 41
    invoke-virtual {p0, v1}, Landroid/view/SurfaceView;->setVisibility(I)V

    .line 42
    .line 43
    .line 44
    :cond_3
    return-void
.end method

.method public onModelReady()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->unityInitReadyListener:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;->onModelReady()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onSwitchScene(Ljava/lang/Integer;)V
    .locals 7

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onSwitchScene, scene: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "Client-SurfaceViewPlayer"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->scene:Ljava/lang/Integer;

    .line 24
    .line 25
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 32
    .line 33
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 34
    .line 35
    const/4 v3, -0x1

    .line 36
    const/4 v4, 0x0

    .line 37
    if-ne v2, v3, :cond_0

    .line 38
    .line 39
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 40
    .line 41
    if-ne v2, v3, :cond_0

    .line 42
    .line 43
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 44
    .line 45
    if-nez v2, :cond_0

    .line 46
    .line 47
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 48
    .line 49
    if-eqz v2, :cond_1

    .line 50
    .line 51
    :cond_0
    iput v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 52
    .line 53
    iput v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 54
    .line 55
    iput v4, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 56
    .line 57
    iput v4, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 58
    .line 59
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 60
    .line 61
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->backgroundView:Landroid/view/SurfaceView;

    .line 65
    .line 66
    invoke-virtual {v0}, Landroid/view/SurfaceView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 71
    .line 72
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 73
    .line 74
    if-ne v2, v3, :cond_2

    .line 75
    .line 76
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 77
    .line 78
    if-ne v2, v3, :cond_2

    .line 79
    .line 80
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 81
    .line 82
    if-nez v2, :cond_2

    .line 83
    .line 84
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 85
    .line 86
    if-eqz v2, :cond_3

    .line 87
    .line 88
    :cond_2
    iput v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 89
    .line 90
    iput v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 91
    .line 92
    iput v4, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 93
    .line 94
    iput v4, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 95
    .line 96
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->backgroundView:Landroid/view/SurfaceView;

    .line 97
    .line 98
    invoke-virtual {v2, v0}, Landroid/view/SurfaceView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 99
    .line 100
    .line 101
    :cond_3
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->thumbnailView:Landroid/view/SurfaceView;

    .line 102
    .line 103
    invoke-virtual {v0}, Landroid/view/SurfaceView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 108
    .line 109
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 110
    .line 111
    if-ne v2, v3, :cond_4

    .line 112
    .line 113
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 114
    .line 115
    if-ne v2, v3, :cond_4

    .line 116
    .line 117
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 118
    .line 119
    if-nez v2, :cond_4

    .line 120
    .line 121
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 122
    .line 123
    if-eqz v2, :cond_5

    .line 124
    .line 125
    :cond_4
    iput v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 126
    .line 127
    iput v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 128
    .line 129
    iput v4, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 130
    .line 131
    iput v4, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 132
    .line 133
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->thumbnailView:Landroid/view/SurfaceView;

    .line 134
    .line 135
    invoke-virtual {v2, v0}, Landroid/view/SurfaceView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 136
    .line 137
    .line 138
    :cond_5
    const/high16 v0, 0x3f800000    # 1.0f

    .line 139
    .line 140
    if-eqz p1, :cond_6

    .line 141
    .line 142
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 143
    .line 144
    .line 145
    move-result p1

    .line 146
    invoke-static {p1}, Lcn/nubia/redmagickyi/digitalhuman/utils/DigitalHumanConstants$Scene;->isAvatarScene(I)Z

    .line 147
    .line 148
    .line 149
    move-result p1

    .line 150
    if-eqz p1, :cond_6

    .line 151
    .line 152
    iget-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;->callback:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;

    .line 153
    .line 154
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 155
    .line 156
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getWidth()I

    .line 157
    .line 158
    .line 159
    move-result v2

    .line 160
    int-to-float v2, v2

    .line 161
    iget-object v3, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 162
    .line 163
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getHeight()I

    .line 164
    .line 165
    .line 166
    move-result v3

    .line 167
    int-to-float v3, v3

    .line 168
    invoke-interface {p1, v2, v3}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;->getAvatarLayoutParams(FF)[F

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    const/4 v3, 0x1

    .line 173
    if-eqz p1, :cond_6

    .line 174
    .line 175
    aget v0, p1, v4

    .line 176
    .line 177
    float-to-int v0, v0

    .line 178
    aget v2, p1, v3

    .line 179
    .line 180
    float-to-int v3, v2

    .line 181
    const/4 v2, 0x2

    .line 182
    aget p1, p1, v2

    .line 183
    .line 184
    move v6, v0

    .line 185
    move v0, p1

    .line 186
    move p1, v3

    .line 187
    move v3, v6

    .line 188
    goto :goto_0

    .line 189
    :cond_6
    move p1, v3

    .line 190
    :goto_0
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->unityView:Landroid/view/SurfaceView;

    .line 191
    .line 192
    invoke-virtual {v2}, Landroid/view/SurfaceView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 193
    .line 194
    .line 195
    move-result-object v2

    .line 196
    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 197
    .line 198
    iget v5, v2, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 199
    .line 200
    if-ne v5, v3, :cond_7

    .line 201
    .line 202
    iget v5, v2, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 203
    .line 204
    if-ne v5, p1, :cond_7

    .line 205
    .line 206
    iget v5, v2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 207
    .line 208
    if-nez v5, :cond_7

    .line 209
    .line 210
    iget v5, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 211
    .line 212
    if-nez v5, :cond_7

    .line 213
    .line 214
    iget-object v5, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->unityView:Landroid/view/SurfaceView;

    .line 215
    .line 216
    invoke-virtual {v5}, Landroid/view/SurfaceView;->getScaleX()F

    .line 217
    .line 218
    .line 219
    move-result v5

    .line 220
    cmpl-float v5, v5, v0

    .line 221
    .line 222
    if-eqz v5, :cond_8

    .line 223
    .line 224
    :cond_7
    const-string v5, "onSwitchScene -> unityView changed"

    .line 225
    .line 226
    invoke-static {v1, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 227
    .line 228
    .line 229
    iput v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 230
    .line 231
    iput p1, v2, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 232
    .line 233
    iput v4, v2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 234
    .line 235
    iput v4, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 236
    .line 237
    iget-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->unityView:Landroid/view/SurfaceView;

    .line 238
    .line 239
    invoke-virtual {p1, v2}, Landroid/view/SurfaceView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 240
    .line 241
    .line 242
    iget-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->unityInitReadyListener:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;

    .line 243
    .line 244
    invoke-virtual {p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;->isModelReady()Z

    .line 245
    .line 246
    .line 247
    move-result p1

    .line 248
    if-eqz p1, :cond_8

    .line 249
    .line 250
    iget-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->unityView:Landroid/view/SurfaceView;

    .line 251
    .line 252
    invoke-virtual {p1, v0}, Landroid/view/SurfaceView;->setScaleX(F)V

    .line 253
    .line 254
    .line 255
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->unityView:Landroid/view/SurfaceView;

    .line 256
    .line 257
    invoke-virtual {p0, v0}, Landroid/view/SurfaceView;->setScaleY(F)V

    .line 258
    .line 259
    .line 260
    :cond_8
    return-void
.end method

.method public refreshBackgroundColor()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->backgroundView:Landroid/view/SurfaceView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/SurfaceView;->getTag()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->backgroundView:Landroid/view/SurfaceView;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/SurfaceView;->getTag()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    instance-of v0, v0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$ProxySurfaceCallback;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->backgroundView:Landroid/view/SurfaceView;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/SurfaceView;->getTag()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$ProxySurfaceCallback;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$ProxySurfaceCallback;->drawBackground()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public setZOrderOnTop(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "setZOrderOnTop: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "Client-SurfaceViewPlayer"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->backgroundView:Landroid/view/SurfaceView;

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Landroid/view/SurfaceView;->setZOrderOnTop(Z)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->thumbnailView:Landroid/view/SurfaceView;

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    invoke-virtual {v0, p1}, Landroid/view/SurfaceView;->setZOrderOnTop(Z)V

    .line 35
    .line 36
    .line 37
    :cond_1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->unityView:Landroid/view/SurfaceView;

    .line 38
    .line 39
    if-eqz p0, :cond_2

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Landroid/view/SurfaceView;->setZOrderOnTop(Z)V

    .line 42
    .line 43
    .line 44
    :cond_2
    return-void
.end method

.method public show()V
    .locals 2

    .line 1
    const-string v0, "Client-SurfaceViewPlayer"

    .line 2
    .line 3
    const-string v1, "show"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;->callback:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-interface {v0, v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;->setHidden(Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->backgroundView:Landroid/view/SurfaceView;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setVisibility(I)V

    .line 26
    .line 27
    .line 28
    :cond_1
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->unityView:Landroid/view/SurfaceView;

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setVisibility(I)V

    .line 33
    .line 34
    .line 35
    :cond_2
    invoke-direct {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->checkIfModelRendered()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public supportedTouchEvent(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "supportedTouchEvent: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "Client-SurfaceViewPlayer"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->unityView:Landroid/view/SurfaceView;

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;->callback:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    :goto_0
    invoke-virtual {v0, p0}, Landroid/view/SurfaceView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method
