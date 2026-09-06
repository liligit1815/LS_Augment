.class Lcom/android/launcher3/taskbar/L$b;
.super Ljava/lang/Object;
.source "KeyboardQuickSwitchViewController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/taskbar/L;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "b"
.end annotation


# instance fields
.field public final a:Landroid/window/OnBackInvokedCallback;

.field final synthetic b:Lcom/android/launcher3/taskbar/L;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/L;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/L$b;->b:Lcom/android/launcher3/taskbar/L;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Lcom/android/launcher3/taskbar/M;

    .line 7
    .line 8
    invoke-direct {p1, p0}, Lcom/android/launcher3/taskbar/M;-><init>(Lcom/android/launcher3/taskbar/L$b;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/android/launcher3/taskbar/L$b;->a:Landroid/window/OnBackInvokedCallback;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/taskbar/L$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/L$b;->c()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic c()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/L$b;->b:Lcom/android/launcher3/taskbar/L;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/L;->k(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method b()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/L$b;->b:Lcom/android/launcher3/taskbar/L;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/taskbar/L;->e(Lcom/android/launcher3/taskbar/L;)Lcom/android/launcher3/taskbar/s$a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/s$a;->d()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method d(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/L$b;->b:Lcom/android/launcher3/taskbar/L;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/android/launcher3/taskbar/L;->i(Lcom/android/launcher3/taskbar/L;I)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/taskbar/L$b;->b:Lcom/android/launcher3/taskbar/L;

    .line 7
    .line 8
    invoke-static {p0}, Lcom/android/launcher3/taskbar/L;->f(Lcom/android/launcher3/taskbar/L;)Lcom/android/launcher3/taskbar/R1;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->N1()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method e(ILandroid/view/KeyEvent;ZZ)Z
    .locals 8

    .line 1
    const/16 v0, 0x42

    .line 2
    .line 3
    const/16 v1, 0x6f

    .line 4
    .line 5
    const/16 v2, 0x44

    .line 6
    .line 7
    const/16 v3, 0x15

    .line 8
    .line 9
    const/16 v4, 0x16

    .line 10
    .line 11
    const/4 v5, 0x0

    .line 12
    const/16 v6, 0x3d

    .line 13
    .line 14
    if-eq p1, v6, :cond_0

    .line 15
    .line 16
    if-eq p1, v4, :cond_0

    .line 17
    .line 18
    if-eq p1, v3, :cond_0

    .line 19
    .line 20
    if-eq p1, v2, :cond_0

    .line 21
    .line 22
    if-eq p1, v1, :cond_0

    .line 23
    .line 24
    if-eq p1, v0, :cond_0

    .line 25
    .line 26
    return v5

    .line 27
    :cond_0
    const/4 v7, 0x1

    .line 28
    if-eq p1, v2, :cond_d

    .line 29
    .line 30
    if-ne p1, v1, :cond_1

    .line 31
    .line 32
    goto/16 :goto_3

    .line 33
    .line 34
    :cond_1
    if-ne p1, v0, :cond_2

    .line 35
    .line 36
    iget-object p1, p0, Lcom/android/launcher3/taskbar/L$b;->b:Lcom/android/launcher3/taskbar/L;

    .line 37
    .line 38
    invoke-static {p1}, Lcom/android/launcher3/taskbar/L;->g(Lcom/android/launcher3/taskbar/L;)I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/L$b;->d(I)V

    .line 43
    .line 44
    .line 45
    return v7

    .line 46
    :cond_2
    if-nez p4, :cond_3

    .line 47
    .line 48
    return v5

    .line 49
    :cond_3
    if-ne p1, v6, :cond_4

    .line 50
    .line 51
    invoke-virtual {p2}, Landroid/view/KeyEvent;->isShiftPressed()Z

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    if-nez p2, :cond_6

    .line 56
    .line 57
    :cond_4
    if-ne p1, v4, :cond_5

    .line 58
    .line 59
    if-nez p3, :cond_6

    .line 60
    .line 61
    :cond_5
    if-ne p1, v3, :cond_7

    .line 62
    .line 63
    if-nez p3, :cond_7

    .line 64
    .line 65
    :cond_6
    move p1, v7

    .line 66
    goto :goto_0

    .line 67
    :cond_7
    move p1, v5

    .line 68
    :goto_0
    iget-object p2, p0, Lcom/android/launcher3/taskbar/L$b;->b:Lcom/android/launcher3/taskbar/L;

    .line 69
    .line 70
    invoke-static {p2}, Lcom/android/launcher3/taskbar/L;->h(Lcom/android/launcher3/taskbar/L;)Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->getTaskCount()I

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    iget-object p3, p0, Lcom/android/launcher3/taskbar/L$b;->b:Lcom/android/launcher3/taskbar/L;

    .line 79
    .line 80
    invoke-static {p3}, Lcom/android/launcher3/taskbar/L;->g(Lcom/android/launcher3/taskbar/L;)I

    .line 81
    .line 82
    .line 83
    move-result p3

    .line 84
    const/4 p4, -0x1

    .line 85
    if-ne p3, p4, :cond_8

    .line 86
    .line 87
    if-le p2, v7, :cond_b

    .line 88
    .line 89
    move v5, v7

    .line 90
    goto :goto_2

    .line 91
    :cond_8
    if-eqz p1, :cond_a

    .line 92
    .line 93
    iget-object p1, p0, Lcom/android/launcher3/taskbar/L$b;->b:Lcom/android/launcher3/taskbar/L;

    .line 94
    .line 95
    invoke-static {p1}, Lcom/android/launcher3/taskbar/L;->g(Lcom/android/launcher3/taskbar/L;)I

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    if-nez p1, :cond_9

    .line 100
    .line 101
    sub-int/2addr p2, v7

    .line 102
    goto :goto_1

    .line 103
    :cond_9
    iget-object p1, p0, Lcom/android/launcher3/taskbar/L$b;->b:Lcom/android/launcher3/taskbar/L;

    .line 104
    .line 105
    invoke-static {p1}, Lcom/android/launcher3/taskbar/L;->g(Lcom/android/launcher3/taskbar/L;)I

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    add-int/lit8 p2, p1, -0x1

    .line 110
    .line 111
    :goto_1
    invoke-static {v5, p2}, Ljava/lang/Math;->max(II)I

    .line 112
    .line 113
    .line 114
    move-result v5

    .line 115
    goto :goto_2

    .line 116
    :cond_a
    iget-object p1, p0, Lcom/android/launcher3/taskbar/L$b;->b:Lcom/android/launcher3/taskbar/L;

    .line 117
    .line 118
    invoke-static {p1}, Lcom/android/launcher3/taskbar/L;->g(Lcom/android/launcher3/taskbar/L;)I

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    add-int/2addr p1, v7

    .line 123
    rem-int v5, p1, p2

    .line 124
    .line 125
    :cond_b
    :goto_2
    iget-object p1, p0, Lcom/android/launcher3/taskbar/L$b;->b:Lcom/android/launcher3/taskbar/L;

    .line 126
    .line 127
    invoke-static {p1}, Lcom/android/launcher3/taskbar/L;->g(Lcom/android/launcher3/taskbar/L;)I

    .line 128
    .line 129
    .line 130
    move-result p1

    .line 131
    if-ne p1, v5, :cond_c

    .line 132
    .line 133
    return v7

    .line 134
    :cond_c
    iget-object p1, p0, Lcom/android/launcher3/taskbar/L$b;->b:Lcom/android/launcher3/taskbar/L;

    .line 135
    .line 136
    invoke-static {p1}, Lcom/android/launcher3/taskbar/L;->h(Lcom/android/launcher3/taskbar/L;)Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    iget-object p0, p0, Lcom/android/launcher3/taskbar/L$b;->b:Lcom/android/launcher3/taskbar/L;

    .line 141
    .line 142
    invoke-static {p0}, Lcom/android/launcher3/taskbar/L;->g(Lcom/android/launcher3/taskbar/L;)I

    .line 143
    .line 144
    .line 145
    move-result p0

    .line 146
    invoke-virtual {p1, p0, v5}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->H(II)V

    .line 147
    .line 148
    .line 149
    return v7

    .line 150
    :cond_d
    :goto_3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/L$b;->b:Lcom/android/launcher3/taskbar/L;

    .line 151
    .line 152
    invoke-virtual {p0, v7}, Lcom/android/launcher3/taskbar/L;->k(Z)V

    .line 153
    .line 154
    .line 155
    return v7
.end method

.method f()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/L$b;->b:Lcom/android/launcher3/taskbar/L;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Lcom/android/launcher3/taskbar/L;->j(Lcom/android/launcher3/taskbar/L;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/taskbar/L$b;->b:Lcom/android/launcher3/taskbar/L;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/L;->k(Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/taskbar/L$b;->b:Lcom/android/launcher3/taskbar/L;

    .line 14
    .line 15
    invoke-static {p0, v1}, Lcom/android/launcher3/taskbar/L;->j(Lcom/android/launcher3/taskbar/L;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method g(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/L$b;->b:Lcom/android/launcher3/taskbar/L;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/android/launcher3/taskbar/L;->i(Lcom/android/launcher3/taskbar/L;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method h(Lcom/android/systemui/shared/recents/model/Task;Ljava/util/function/Consumer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/systemui/shared/recents/model/Task;",
            "Ljava/util/function/Consumer<",
            "Lcom/android/systemui/shared/recents/model/Task;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/L$b;->b:Lcom/android/launcher3/taskbar/L;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/taskbar/L;->e(Lcom/android/launcher3/taskbar/L;)Lcom/android/launcher3/taskbar/s$a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/s$a;->i(Lcom/android/systemui/shared/recents/model/Task;Ljava/util/function/Consumer;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method i(Lcom/android/systemui/shared/recents/model/Task;Ljava/util/function/Consumer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/systemui/shared/recents/model/Task;",
            "Ljava/util/function/Consumer<",
            "Lcom/android/systemui/shared/recents/model/ThumbnailData;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/L$b;->b:Lcom/android/launcher3/taskbar/L;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/taskbar/L;->e(Lcom/android/launcher3/taskbar/L;)Lcom/android/launcher3/taskbar/s$a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/s$a;->j(Lcom/android/systemui/shared/recents/model/Task;Ljava/util/function/Consumer;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
