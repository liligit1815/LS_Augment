.class Ly1/b$d;
.super Ljava/lang/Object;
.source "LauncherClient.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ly1/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "d"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Ly1/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ly1/b$d;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .locals 7

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->b2()Ly1/b;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-nez v1, :cond_1

    .line 14
    .line 15
    return v0

    .line 16
    :cond_1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    new-instance v3, Landroid/graphics/Point;

    .line 21
    .line 22
    invoke-direct {v3}, Landroid/graphics/Point;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    invoke-virtual {v4, v3}, Landroid/view/Display;->getRealSize(Landroid/graphics/Point;)V

    .line 30
    .line 31
    .line 32
    iget v4, v3, Landroid/graphics/Point;->x:I

    .line 33
    .line 34
    iget v3, v3, Landroid/graphics/Point;->y:I

    .line 35
    .line 36
    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    iget v5, p1, Landroid/os/Message;->what:I

    .line 45
    .line 46
    const/4 v6, 0x0

    .line 47
    packed-switch v5, :pswitch_data_0

    .line 48
    .line 49
    .line 50
    return v6

    .line 51
    :pswitch_0
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    sub-int/2addr p0, v0

    .line 64
    invoke-static {v6, p0}, Ljava/lang/Math;->max(II)I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    invoke-virtual {p1, p0}, Lcom/android/launcher3/V4;->snapToPageImmediately(I)Z

    .line 69
    .line 70
    .line 71
    return v0

    .line 72
    :pswitch_1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p0, v6}, Lcom/android/launcher3/V4;->snapToPageImmediately(I)Z

    .line 77
    .line 78
    .line 79
    return v0

    .line 80
    :pswitch_2
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 81
    .line 82
    check-cast p1, Ljava/lang/String;

    .line 83
    .line 84
    invoke-static {v1, p0, p1}, Ly1/b;->j(Ly1/b;Lcom/android/launcher3/C2;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    :pswitch_3
    return v0

    .line 88
    :pswitch_4
    iget p0, p1, Landroid/os/Message;->arg1:I

    .line 89
    .line 90
    invoke-static {v1, p0}, Ly1/b;->k(Ly1/b;I)V

    .line 91
    .line 92
    .line 93
    return v0

    .line 94
    :pswitch_5
    invoke-virtual {v4}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 99
    .line 100
    check-cast p1, Ljava/lang/Boolean;

    .line 101
    .line 102
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    if-eqz p1, :cond_2

    .line 107
    .line 108
    iput v3, p0, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 109
    .line 110
    iget p1, p0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 111
    .line 112
    or-int/lit16 p1, p1, 0x200

    .line 113
    .line 114
    iput p1, p0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 115
    .line 116
    :cond_2
    invoke-virtual {v4}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-interface {v2, p1, p0}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 121
    .line 122
    .line 123
    return v0

    .line 124
    :pswitch_6
    invoke-static {v1}, Ly1/b;->e(Ly1/b;)I

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    and-int/2addr p0, v0

    .line 129
    if-eqz p0, :cond_3

    .line 130
    .line 131
    invoke-static {v1}, Ly1/b;->c(Ly1/b;)Ly1/d;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 136
    .line 137
    check-cast p1, Ljava/lang/Float;

    .line 138
    .line 139
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    invoke-interface {p0, p1}, Ly1/d;->a(F)V

    .line 144
    .line 145
    .line 146
    :cond_3
    return v0

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
