.class public Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;
.super Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;
.source "TextureViewPlayer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;,
        Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Client-TextureViewPlayer"


# instance fields
.field private backgroundView:Landroid/view/TextureView;

.field private myView:Landroid/view/ViewGroup;

.field private parentView:Landroid/view/View;

.field private sOriginalElevation:Ljava/lang/Float;

.field private scene:Ljava/lang/Integer;

.field private thumbnailView:Landroid/view/TextureView;

.field private unityInitReadyListener:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;

.field private unityView:Landroid/view/TextureView;


# direct methods
.method public constructor <init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;-><init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-direct {p1, p0, v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;-><init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$1;)V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->unityInitReadyListener:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;

    .line 11
    .line 12
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->sOriginalElevation:Ljava/lang/Float;

    .line 13
    .line 14
    const-string p0, "Client-TextureViewPlayer"

    .line 15
    .line 16
    const-string p1, "create player"

    .line 17
    .line 18
    invoke-static {p0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method static synthetic access$100(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->checkIfModelRendered()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic access$200(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->scene:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic access$300(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;)Landroid/view/TextureView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->thumbnailView:Landroid/view/TextureView;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic access$400(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;)Landroid/view/TextureView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->unityView:Landroid/view/TextureView;

    .line 2
    .line 3
    return-object p0
.end method

.method private addView(Landroid/view/ViewGroup;Landroid/view/View;Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    if-eqz p3, :cond_1

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    :cond_1
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-nez p0, :cond_2

    .line 16
    .line 17
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_2
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    if-eq p0, p1, :cond_3

    .line 26
    .line 27
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Landroid/view/ViewGroup;

    .line 32
    .line 33
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    :cond_3
    :goto_0
    return-void
.end method

.method private checkIfModelRendered()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->scene:Ljava/lang/Integer;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->onSwitchScene(Ljava/lang/Integer;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->unityInitReadyListener:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->isModelRendered()Z

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
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->thumbnailView:Landroid/view/TextureView;

    .line 16
    .line 17
    if-eqz v0, :cond_3

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/TextureView;->setAlpha(F)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->thumbnailView:Landroid/view/TextureView;

    .line 23
    .line 24
    const/16 v0, 0x8

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/TextureView;->setVisibility(I)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->thumbnailView:Landroid/view/TextureView;

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    const/high16 v2, 0x3f800000    # 1.0f

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Landroid/view/TextureView;->setAlpha(F)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->thumbnailView:Landroid/view/TextureView;

    .line 40
    .line 41
    const/4 v2, 0x0

    .line 42
    invoke-virtual {v0, v2}, Landroid/view/TextureView;->setVisibility(I)V

    .line 43
    .line 44
    .line 45
    :cond_1
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->unityView:Landroid/view/TextureView;

    .line 46
    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/view/TextureView;->setScaleX(F)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->unityView:Landroid/view/TextureView;

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/view/TextureView;->setScaleY(F)V

    .line 55
    .line 56
    .line 57
    :cond_2
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->unityInitReadyListener:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;

    .line 58
    .line 59
    invoke-virtual {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->isModelReady()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_3

    .line 64
    .line 65
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->onModelReady()V

    .line 66
    .line 67
    .line 68
    :cond_3
    return-void
.end method

.method private createTextureView(Landroid/content/Context;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;)Landroid/view/TextureView;
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
    const-string v1, "Client-TextureViewPlayer"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    new-instance v0, Landroid/view/TextureView;

    .line 24
    .line 25
    invoke-direct {v0, p1}, Landroid/view/TextureView;-><init>(Landroid/content/Context;)V

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
    invoke-virtual {v0, p1}, Landroid/view/TextureView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 39
    .line 40
    .line 41
    const/4 p1, 0x0

    .line 42
    invoke-virtual {v0, p1}, Landroid/view/TextureView;->setOpaque(Z)V

    .line 43
    .line 44
    .line 45
    new-instance p1, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;

    .line 46
    .line 47
    invoke-direct {p1, p0, p2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;-><init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, p1}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, p1}, Landroid/view/TextureView;->setTag(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
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
    const-string v1, "Client-TextureViewPlayer"

    .line 35
    .line 36
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->parentView:Landroid/view/View;

    .line 40
    .line 41
    if-eq v0, p1, :cond_2

    .line 42
    .line 43
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->parentView:Landroid/view/View;

    .line 44
    .line 45
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->myView:Landroid/view/ViewGroup;

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
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->myView:Landroid/view/ViewGroup;

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
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->myView:Landroid/view/ViewGroup;

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
    invoke-direct {p0, v0, v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->createTextureView(Landroid/content/Context;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;)Landroid/view/TextureView;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->backgroundView:Landroid/view/TextureView;

    .line 88
    .line 89
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    invoke-virtual {v0, v1}, Landroid/view/TextureView;->setId(I)V

    .line 106
    .line 107
    .line 108
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 109
    .line 110
    iget-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->backgroundView:Landroid/view/TextureView;

    .line 111
    .line 112
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    sget-object v1, Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;->Thumbnail:Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;

    .line 120
    .line 121
    invoke-direct {p0, v0, v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->createTextureView(Landroid/content/Context;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;)Landroid/view/TextureView;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->thumbnailView:Landroid/view/TextureView;

    .line 126
    .line 127
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    invoke-virtual {v0, v1}, Landroid/view/TextureView;->setId(I)V

    .line 144
    .line 145
    .line 146
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 147
    .line 148
    iget-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->thumbnailView:Landroid/view/TextureView;

    .line 149
    .line 150
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    sget-object v1, Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;->Unity:Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;

    .line 158
    .line 159
    invoke-direct {p0, v0, v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->createTextureView(Landroid/content/Context;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;)Landroid/view/TextureView;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->unityView:Landroid/view/TextureView;

    .line 164
    .line 165
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 178
    .line 179
    .line 180
    move-result v1

    .line 181
    invoke-virtual {v0, v1}, Landroid/view/TextureView;->setId(I)V

    .line 182
    .line 183
    .line 184
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 185
    .line 186
    iget-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->unityView:Landroid/view/TextureView;

    .line 187
    .line 188
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 189
    .line 190
    .line 191
    invoke-direct {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->checkIfModelRendered()V

    .line 192
    .line 193
    .line 194
    :cond_1
    if-nez p3, :cond_2

    .line 195
    .line 196
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 197
    .line 198
    const/4 v1, 0x0

    .line 199
    invoke-direct {p0, p1, v0, v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->addView(Landroid/view/ViewGroup;Landroid/view/View;Z)V

    .line 200
    .line 201
    .line 202
    :cond_2
    if-eqz p3, :cond_3

    .line 203
    .line 204
    iget-object p3, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 205
    .line 206
    const/4 v0, 0x1

    .line 207
    invoke-direct {p0, p1, p3, v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->addView(Landroid/view/ViewGroup;Landroid/view/View;Z)V

    .line 208
    .line 209
    .line 210
    :cond_3
    if-eqz p2, :cond_5

    .line 211
    .line 212
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 213
    .line 214
    .line 215
    move-result p1

    .line 216
    if-eqz p1, :cond_4

    .line 217
    .line 218
    goto :goto_0

    .line 219
    :cond_4
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->show()V

    .line 220
    .line 221
    .line 222
    return-void

    .line 223
    :cond_5
    :goto_0
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->hide()V

    .line 224
    .line 225
    .line 226
    return-void
.end method

.method public clearState()V
    .locals 2

    .line 1
    const-string v0, "Client-TextureViewPlayer"

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
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->parentView:Landroid/view/View;

    .line 10
    .line 11
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->myView:Landroid/view/ViewGroup;

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
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->unityInitReadyListener:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->restoreState()V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method

.method public hide()V
    .locals 3

    .line 1
    const-string v0, "Client-TextureViewPlayer"

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
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->myView:Landroid/view/ViewGroup;

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
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->backgroundView:Landroid/view/TextureView;

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/view/TextureView;->setVisibility(I)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->backgroundView:Landroid/view/TextureView;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/view/TextureView;->getParent()Landroid/view/ViewParent;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->backgroundView:Landroid/view/TextureView;

    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/view/TextureView;->getParent()Landroid/view/ViewParent;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Landroid/view/ViewGroup;

    .line 45
    .line 46
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->backgroundView:Landroid/view/TextureView;

    .line 47
    .line 48
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->thumbnailView:Landroid/view/TextureView;

    .line 52
    .line 53
    if-eqz v0, :cond_2

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/view/TextureView;->setVisibility(I)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->thumbnailView:Landroid/view/TextureView;

    .line 59
    .line 60
    invoke-virtual {v0}, Landroid/view/TextureView;->getParent()Landroid/view/ViewParent;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    if-eqz v0, :cond_2

    .line 65
    .line 66
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->thumbnailView:Landroid/view/TextureView;

    .line 67
    .line 68
    invoke-virtual {v0}, Landroid/view/TextureView;->getParent()Landroid/view/ViewParent;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Landroid/view/ViewGroup;

    .line 73
    .line 74
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->thumbnailView:Landroid/view/TextureView;

    .line 75
    .line 76
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 77
    .line 78
    .line 79
    :cond_2
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->unityView:Landroid/view/TextureView;

    .line 80
    .line 81
    if-eqz v0, :cond_3

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Landroid/view/TextureView;->setVisibility(I)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->unityView:Landroid/view/TextureView;

    .line 87
    .line 88
    invoke-virtual {v0}, Landroid/view/TextureView;->getParent()Landroid/view/ViewParent;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    if-eqz v0, :cond_3

    .line 93
    .line 94
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->unityView:Landroid/view/TextureView;

    .line 95
    .line 96
    invoke-virtual {v0}, Landroid/view/TextureView;->getParent()Landroid/view/ViewParent;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    check-cast v0, Landroid/view/ViewGroup;

    .line 101
    .line 102
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->unityView:Landroid/view/TextureView;

    .line 103
    .line 104
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 105
    .line 106
    .line 107
    :cond_3
    return-void
.end method

.method public onModelReady()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->unityInitReadyListener:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->onModelReady()V

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
    const-string v1, "Client-TextureViewPlayer"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->scene:Ljava/lang/Integer;

    .line 24
    .line 25
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->myView:Landroid/view/ViewGroup;

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
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 60
    .line 61
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->backgroundView:Landroid/view/TextureView;

    .line 65
    .line 66
    invoke-virtual {v0}, Landroid/view/TextureView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

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
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->backgroundView:Landroid/view/TextureView;

    .line 97
    .line 98
    invoke-virtual {v2, v0}, Landroid/view/TextureView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 99
    .line 100
    .line 101
    :cond_3
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->thumbnailView:Landroid/view/TextureView;

    .line 102
    .line 103
    invoke-virtual {v0}, Landroid/view/TextureView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

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
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->thumbnailView:Landroid/view/TextureView;

    .line 134
    .line 135
    invoke-virtual {v2, v0}, Landroid/view/TextureView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

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
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->myView:Landroid/view/ViewGroup;

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
    iget-object v3, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->myView:Landroid/view/ViewGroup;

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
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->unityView:Landroid/view/TextureView;

    .line 191
    .line 192
    invoke-virtual {v2}, Landroid/view/TextureView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

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
    iget-object v5, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->unityView:Landroid/view/TextureView;

    .line 215
    .line 216
    invoke-virtual {v5}, Landroid/view/TextureView;->getScaleX()F

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
    iget-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->unityView:Landroid/view/TextureView;

    .line 238
    .line 239
    invoke-virtual {p1, v2}, Landroid/view/TextureView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 240
    .line 241
    .line 242
    iget-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->unityInitReadyListener:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;

    .line 243
    .line 244
    invoke-virtual {p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->isModelReady()Z

    .line 245
    .line 246
    .line 247
    move-result p1

    .line 248
    if-eqz p1, :cond_8

    .line 249
    .line 250
    iget-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->unityView:Landroid/view/TextureView;

    .line 251
    .line 252
    invoke-virtual {p1, v0}, Landroid/view/TextureView;->setScaleX(F)V

    .line 253
    .line 254
    .line 255
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->unityView:Landroid/view/TextureView;

    .line 256
    .line 257
    invoke-virtual {p0, v0}, Landroid/view/TextureView;->setScaleY(F)V

    .line 258
    .line 259
    .line 260
    :cond_8
    return-void
.end method

.method public refreshBackgroundColor()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->backgroundView:Landroid/view/TextureView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/TextureView;->getTag()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->backgroundView:Landroid/view/TextureView;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/TextureView;->getTag()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    instance-of v0, v0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->backgroundView:Landroid/view/TextureView;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/TextureView;->getTag()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;->drawBackground()V

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
    const-string v1, "Client-TextureViewPlayer"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->parentView:Landroid/view/View;

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/view/View;->getElevation()F

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->sOriginalElevation:Ljava/lang/Float;

    .line 34
    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->sOriginalElevation:Ljava/lang/Float;

    .line 42
    .line 43
    :cond_0
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->parentView:Landroid/view/View;

    .line 44
    .line 45
    const p1, 0x7f7fffff    # Float.MAX_VALUE

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, p1}, Landroid/view/View;->setElevation(F)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_1
    iget-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->sOriginalElevation:Ljava/lang/Float;

    .line 53
    .line 54
    if-eqz p1, :cond_2

    .line 55
    .line 56
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    invoke-virtual {v0, p1}, Landroid/view/View;->setElevation(F)V

    .line 61
    .line 62
    .line 63
    const/4 p1, 0x0

    .line 64
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->sOriginalElevation:Ljava/lang/Float;

    .line 65
    .line 66
    :cond_2
    return-void
.end method

.method public show()V
    .locals 3

    .line 1
    const-string v0, "Client-TextureViewPlayer"

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
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->myView:Landroid/view/ViewGroup;

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
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->backgroundView:Landroid/view/TextureView;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/view/TextureView;->setVisibility(I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 29
    .line 30
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->backgroundView:Landroid/view/TextureView;

    .line 31
    .line 32
    invoke-direct {p0, v0, v2, v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->addView(Landroid/view/ViewGroup;Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    :cond_1
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->thumbnailView:Landroid/view/TextureView;

    .line 36
    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 40
    .line 41
    invoke-direct {p0, v2, v0, v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->addView(Landroid/view/ViewGroup;Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    :cond_2
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->unityView:Landroid/view/TextureView;

    .line 45
    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/view/TextureView;->setVisibility(I)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->myView:Landroid/view/ViewGroup;

    .line 52
    .line 53
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->unityView:Landroid/view/TextureView;

    .line 54
    .line 55
    invoke-direct {p0, v0, v2, v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->addView(Landroid/view/ViewGroup;Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    :cond_3
    invoke-direct {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->checkIfModelRendered()V

    .line 59
    .line 60
    .line 61
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
    const-string v1, "Client-TextureViewPlayer"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->unityView:Landroid/view/TextureView;

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
    invoke-virtual {v0, p0}, Landroid/view/TextureView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method
