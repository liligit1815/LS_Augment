.class public Lcom/android/launcher3/util/Z;
.super Ljava/lang/Object;
.source "DisplayController.java"

# interfaces
.implements Lcom/android/launcher3/util/window/d$a;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "NewApi"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/util/Z$d;,
        Lcom/android/launcher3/util/Z$c;,
        Lcom/android/launcher3/util/Z$b;,
        Lcom/android/launcher3/util/Z$e;
    }
.end annotation


# static fields
.field private static p:Z = false

.field private static q:Z = true

.field public static final r:Lcom/android/launcher3/util/I;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "Lcom/android/launcher3/util/Z;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final g:Lcom/android/launcher3/util/window/d;

.field private final h:Landroid/content/Context;

.field private i:Lcom/android/launcher3/util/Z$b;

.field private final j:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/android/launcher3/util/Z$d;",
            ">;"
        }
    .end annotation
.end field

.field private final k:Lcom/android/launcher3/util/x2;

.field private l:Z

.field private m:Z

.field private n:I

.field public o:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/util/P;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/android/launcher3/util/P;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/android/launcher3/util/Z;->r:Lcom/android/launcher3/util/I;

    .line 12
    .line 13
    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;Lcom/android/launcher3/util/window/d;Lcom/android/launcher3/J3;Lcom/android/launcher3/util/K;)V
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    .line 4
    .line 5
    new-instance v1, Landroid/util/SparseArray;

    .line 6
    .line 7
    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v1, p0, Lcom/android/launcher3/util/Z;->j:Landroid/util/SparseArray;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    iput-boolean v1, p0, Lcom/android/launcher3/util/Z;->l:Z

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-static {p1, v2, v1}, Lx1/O;->D(Landroid/content/Context;Landroid/content/res/Resources;Z)V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Lcom/android/launcher3/util/Z;->h:Landroid/content/Context;

    .line 23
    .line 24
    iput-object p2, p0, Lcom/android/launcher3/util/Z;->g:Lcom/android/launcher3/util/window/d;

    .line 25
    .line 26
    invoke-static {}, Lf1/a;->e()Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    new-instance v2, Lcom/android/launcher3/util/U;

    .line 33
    .line 34
    invoke-direct {v2, p0, p3}, Lcom/android/launcher3/util/U;-><init>(Lcom/android/launcher3/util/Z;Lcom/android/launcher3/J3;)V

    .line 35
    .line 36
    .line 37
    new-array v3, v0, [Lcom/android/launcher3/H1;

    .line 38
    .line 39
    sget-object v4, Lcom/android/launcher3/J3;->j:Lcom/android/launcher3/X;

    .line 40
    .line 41
    aput-object v4, v3, v1

    .line 42
    .line 43
    invoke-virtual {p3, v2, v3}, Lcom/android/launcher3/J3;->d(Lcom/android/launcher3/F3;[Lcom/android/launcher3/H1;)V

    .line 44
    .line 45
    .line 46
    new-array v0, v0, [Lcom/android/launcher3/H1;

    .line 47
    .line 48
    sget-object v3, Lcom/android/launcher3/J3;->k:Lcom/android/launcher3/X;

    .line 49
    .line 50
    aput-object v3, v0, v1

    .line 51
    .line 52
    invoke-virtual {p3, v2, v0}, Lcom/android/launcher3/J3;->d(Lcom/android/launcher3/F3;[Lcom/android/launcher3/H1;)V

    .line 53
    .line 54
    .line 55
    new-instance v0, Lcom/android/launcher3/util/V;

    .line 56
    .line 57
    invoke-direct {v0, p3, v2}, Lcom/android/launcher3/util/V;-><init>(Lcom/android/launcher3/J3;Lcom/android/launcher3/F3;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p4, v0}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 61
    .line 62
    .line 63
    :cond_0
    const-class p3, Landroid/hardware/display/DisplayManager;

    .line 64
    .line 65
    invoke-virtual {p1, p3}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p3

    .line 69
    check-cast p3, Landroid/hardware/display/DisplayManager;

    .line 70
    .line 71
    invoke-virtual {p3, v1}, Landroid/hardware/display/DisplayManager;->getDisplay(I)Landroid/view/Display;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-direct {p0, v0}, Lcom/android/launcher3/util/Z;->A(Landroid/view/Display;)Lcom/android/launcher3/util/Z$d;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iget-object v2, v0, Lcom/android/launcher3/util/Z$d;->i:Landroid/content/Context;

    .line 80
    .line 81
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    invoke-static {v2, v3, v1}, Lx1/O;->D(Landroid/content/Context;Landroid/content/res/Resources;Z)V

    .line 86
    .line 87
    .line 88
    iget-object v1, v0, Lcom/android/launcher3/util/Z$d;->i:Landroid/content/Context;

    .line 89
    .line 90
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    iget v1, v1, Landroid/content/res/Configuration;->orientation:I

    .line 99
    .line 100
    iput v1, p0, Lcom/android/launcher3/util/Z;->n:I

    .line 101
    .line 102
    new-instance v1, Lcom/android/launcher3/util/x2;

    .line 103
    .line 104
    sget-object v2, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 105
    .line 106
    new-instance v3, Lcom/android/launcher3/util/W;

    .line 107
    .line 108
    invoke-direct {v3, p0}, Lcom/android/launcher3/util/W;-><init>(Lcom/android/launcher3/util/Z;)V

    .line 109
    .line 110
    .line 111
    invoke-direct {v1, p1, v2, v3}, Lcom/android/launcher3/util/x2;-><init>(Landroid/content/Context;Lcom/android/launcher3/util/p1;Ljava/util/function/Consumer;)V

    .line 112
    .line 113
    .line 114
    iput-object v1, p0, Lcom/android/launcher3/util/Z;->k:Lcom/android/launcher3/util/x2;

    .line 115
    .line 116
    const-string p1, "android.intent.action.OVERLAY_CHANGED"

    .line 117
    .line 118
    filled-new-array {p1}, [Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    const-string v3, "android"

    .line 123
    .line 124
    invoke-virtual {v1, v3, p1}, Lcom/android/launcher3/util/x2;->u(Ljava/lang/String;[Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p2, p0}, Lcom/android/launcher3/util/window/d;->registerDesktopVisibilityListener(Lcom/android/launcher3/util/window/d$a;)V

    .line 128
    .line 129
    .line 130
    new-instance p1, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 133
    .line 134
    .line 135
    const-string v1, "(CTOR) perDisplayBounds: "

    .line 136
    .line 137
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    iget-object v1, v0, Lcom/android/launcher3/util/Z$d;->j:Lcom/android/launcher3/util/Z$c;

    .line 141
    .line 142
    invoke-static {v1}, Lcom/android/launcher3/util/Z$c;->g(Lcom/android/launcher3/util/Z$c;)Lx1/u;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    const-string v1, "DisplayController"

    .line 154
    .line 155
    invoke-static {v1, p1}, Lcom/android/launcher3/logging/b;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    invoke-static {}, Lcom/android/launcher3/y0;->M()Z

    .line 159
    .line 160
    .line 161
    move-result p1

    .line 162
    if-eqz p1, :cond_1

    .line 163
    .line 164
    new-instance p1, Lcom/android/launcher3/util/Z$a;

    .line 165
    .line 166
    invoke-direct {p1, p0, p3}, Lcom/android/launcher3/util/Z$a;-><init>(Lcom/android/launcher3/util/Z;Landroid/hardware/display/DisplayManager;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v2}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    invoke-virtual {p3, p1, v1}, Landroid/hardware/display/DisplayManager;->registerDisplayListener(Landroid/hardware/display/DisplayManager$DisplayListener;Landroid/os/Handler;)V

    .line 174
    .line 175
    .line 176
    new-instance v1, Lcom/android/launcher3/util/X;

    .line 177
    .line 178
    invoke-direct {v1, p3, p1}, Lcom/android/launcher3/util/X;-><init>(Landroid/hardware/display/DisplayManager;Landroid/hardware/display/DisplayManager$DisplayListener;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {p4, v1}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {p3}, Landroid/hardware/display/DisplayManager;->getDisplays()[Landroid/view/Display;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    invoke-static {p1}, Ljava/util/Arrays;->stream([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    new-instance v1, Lcom/android/launcher3/util/Y;

    .line 193
    .line 194
    invoke-direct {v1, p0, p3}, Lcom/android/launcher3/util/Y;-><init>(Lcom/android/launcher3/util/Z;Landroid/hardware/display/DisplayManager;)V

    .line 195
    .line 196
    .line 197
    invoke-interface {p1, v1}, Ljava/util/stream/Stream;->forEach(Ljava/util/function/Consumer;)V

    .line 198
    .line 199
    .line 200
    :cond_1
    new-instance p1, Lcom/android/launcher3/util/O;

    .line 201
    .line 202
    invoke-direct {p1, p0, v0, p2}, Lcom/android/launcher3/util/O;-><init>(Lcom/android/launcher3/util/Z;Lcom/android/launcher3/util/Z$d;Lcom/android/launcher3/util/window/d;)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {p4, p1}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 206
    .line 207
    .line 208
    return-void
.end method

.method private A(Landroid/view/Display;)Lcom/android/launcher3/util/Z$d;
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/Display;->getDisplayId()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/util/Z;->j:Landroid/util/SparseArray;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Lcom/android/launcher3/util/Z$d;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    return-object v1

    .line 16
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/util/Z;->h:Landroid/content/Context;

    .line 17
    .line 18
    const/4 v2, 0x2

    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-virtual {v1, p1, v2, v3}, Landroid/content/Context;->createWindowContext(Landroid/view/Display;ILandroid/os/Bundle;)Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const/4 v2, 0x0

    .line 29
    invoke-static {p1, v1, v2}, Lx1/O;->D(Landroid/content/Context;Landroid/content/res/Resources;Z)V

    .line 30
    .line 31
    .line 32
    new-instance v1, Lcom/android/launcher3/util/Z$c;

    .line 33
    .line 34
    iget-object v2, p0, Lcom/android/launcher3/util/Z;->g:Lcom/android/launcher3/util/window/d;

    .line 35
    .line 36
    invoke-virtual {v2, p1}, Lcom/android/launcher3/util/window/d;->estimateInternalDisplayBounds(Landroid/content/Context;)Landroid/util/ArrayMap;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-direct {v1, p1, v2, v3}, Lcom/android/launcher3/util/Z$c;-><init>(Landroid/content/Context;Lcom/android/launcher3/util/window/d;Ljava/util/Map;)V

    .line 41
    .line 42
    .line 43
    new-instance v2, Lcom/android/launcher3/util/Z$d;

    .line 44
    .line 45
    invoke-direct {v2, p0, v0, p1, v1}, Lcom/android/launcher3/util/Z$d;-><init>(Lcom/android/launcher3/util/Z;ILandroid/content/Context;Lcom/android/launcher3/util/Z$c;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/android/launcher3/util/Z;->j:Landroid/util/SparseArray;

    .line 49
    .line 50
    invoke-virtual {p0, v0, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    return-object v2
.end method

.method public static B(Landroid/content/Context;)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/util/Z;->r:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/util/Z;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/util/Z;->w()Lcom/android/launcher3/util/Z$c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/util/Z$c;->o()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public static C(Landroid/content/Context;)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/util/Z;->r:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/util/Z;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/util/Z;->w()Lcom/android/launcher3/util/Z$c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/util/Z$c;->p()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public static D(Landroid/content/Context;)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/util/Z;->r:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/util/Z;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/util/Z;->w()Lcom/android/launcher3/util/Z$c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/util/Z$c;->r()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method private synthetic E(Lcom/android/launcher3/J3;Ljava/lang/String;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/util/Z;->w()Lcom/android/launcher3/util/Z$c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "TASKBAR_PINNING_KEY"

    .line 6
    .line 7
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x1

    .line 12
    const/4 v3, 0x0

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-static {v0}, Lcom/android/launcher3/util/Z$c;->e(Lcom/android/launcher3/util/Z$c;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    sget-object v4, Lcom/android/launcher3/J3;->j:Lcom/android/launcher3/X;

    .line 20
    .line 21
    invoke-virtual {p1, v4}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    check-cast v4, Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    if-eq v1, v4, :cond_0

    .line 32
    .line 33
    move v1, v2

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    move v1, v3

    .line 36
    :goto_0
    const-string v4, "TASKBAR_PINNING_DESKTOP_MODE_KEY"

    .line 37
    .line 38
    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    if-eqz p2, :cond_1

    .line 43
    .line 44
    invoke-static {v0}, Lcom/android/launcher3/util/Z$c;->f(Lcom/android/launcher3/util/Z$c;)Z

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    sget-object v0, Lcom/android/launcher3/J3;->k:Lcom/android/launcher3/X;

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    check-cast p1, Ljava/lang/Boolean;

    .line 55
    .line 56
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eq p2, p1, :cond_1

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_1
    move v2, v3

    .line 64
    :goto_1
    if-nez v1, :cond_3

    .line 65
    .line 66
    if-eqz v2, :cond_2

    .line 67
    .line 68
    goto :goto_2

    .line 69
    :cond_2
    return-void

    .line 70
    :cond_3
    :goto_2
    invoke-virtual {p0, v3}, Lcom/android/launcher3/util/Z;->L(I)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method private synthetic F(Landroid/hardware/display/DisplayManager;Landroid/view/Display;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/view/Display;->getDisplayId()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-virtual {p1, p2}, Landroid/hardware/display/DisplayManager;->getDisplay(I)Landroid/view/Display;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-direct {p0, p1}, Lcom/android/launcher3/util/Z;->A(Landroid/view/Display;)Lcom/android/launcher3/util/Z$d;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic G(Lcom/android/launcher3/util/Z$d;Lcom/android/launcher3/util/window/d;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/util/Z;->l:Z

    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/android/launcher3/util/Z$d;->b()V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/android/launcher3/util/Z;->k:Lcom/android/launcher3/util/x2;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/android/launcher3/util/x2;->v()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2, p0}, Lcom/android/launcher3/util/window/d;->unregisterDesktopVisibilityListener(Lcom/android/launcher3/util/window/d$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private synthetic H(Lcom/android/launcher3/util/Z$d;Lcom/android/launcher3/util/Z$c;II)V
    .locals 0

    .line 1
    iput-object p2, p1, Lcom/android/launcher3/util/Z$d;->j:Lcom/android/launcher3/util/Z$c;

    .line 2
    .line 3
    if-nez p3, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/util/Z;->i:Lcom/android/launcher3/util/Z$b;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-object p3, p1, Lcom/android/launcher3/util/Z$d;->i:Landroid/content/Context;

    .line 10
    .line 11
    invoke-interface {p0, p3, p2, p4}, Lcom/android/launcher3/util/Z$b;->onDisplayInfoChanged(Landroid/content/Context;Lcom/android/launcher3/util/Z$c;I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-virtual {p1, p2, p4}, Lcom/android/launcher3/util/Z$d;->c(Lcom/android/launcher3/util/Z$c;I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private synthetic I(Landroid/content/Context;Landroid/content/res/Configuration;Lcom/android/launcher3/util/Z$c;Lcom/android/launcher3/util/Z$d;)V
    .locals 6

    .line 1
    sget-object v0, Lcom/android/launcher3/util/window/d;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/launcher3/util/window/d;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/Z;->v(Landroid/content/Context;)Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/window/d;->getDisplayInfo(Landroid/content/Context;)Lcom/android/launcher3/util/window/a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget v1, p2, Landroid/content/res/Configuration;->densityDpi:I

    .line 18
    .line 19
    invoke-static {p3}, Lcom/android/launcher3/util/Z$c;->c(Lcom/android/launcher3/util/Z$c;)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    const/4 v3, 0x1

    .line 24
    if-ne v1, v2, :cond_0

    .line 25
    .line 26
    iget v1, p2, Landroid/content/res/Configuration;->fontScale:F

    .line 27
    .line 28
    iget v2, p3, Lcom/android/launcher3/util/Z$c;->e:F

    .line 29
    .line 30
    invoke-static {v1, v2}, Ljava/lang/Float;->compare(FF)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-nez v1, :cond_0

    .line 35
    .line 36
    invoke-static {p3}, Lcom/android/launcher3/util/Z$c;->h(Lcom/android/launcher3/util/Z$c;)Lcom/android/launcher3/util/Z$e;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    new-instance v2, Lcom/android/launcher3/util/Z$e;

    .line 41
    .line 42
    iget v4, p2, Landroid/content/res/Configuration;->screenHeightDp:I

    .line 43
    .line 44
    iget v5, p2, Landroid/content/res/Configuration;->screenWidthDp:I

    .line 45
    .line 46
    invoke-direct {v2, v4, v5}, Lcom/android/launcher3/util/Z$e;-><init>(II)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/Z$e;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_0

    .line 54
    .line 55
    invoke-virtual {p1}, Landroid/content/Context;->getDisplay()Landroid/view/Display;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v1}, Landroid/view/Display;->getRotation()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    iget v2, p3, Lcom/android/launcher3/util/Z$c;->b:I

    .line 64
    .line 65
    if-ne v1, v2, :cond_0

    .line 66
    .line 67
    iget-object v1, p0, Lcom/android/launcher3/util/Z;->g:Lcom/android/launcher3/util/window/d;

    .line 68
    .line 69
    invoke-virtual {v1, p1}, Lcom/android/launcher3/util/window/d;->showLockedTaskbarOnHome(Landroid/content/Context;)Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    invoke-virtual {p3}, Lcom/android/launcher3/util/Z$c;->u()Z

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-ne v1, v2, :cond_0

    .line 78
    .line 79
    iget-object v1, p0, Lcom/android/launcher3/util/Z;->g:Lcom/android/launcher3/util/window/d;

    .line 80
    .line 81
    invoke-virtual {v1, p1}, Lcom/android/launcher3/util/window/d;->showDesktopTaskbarForFreeformDisplay(Landroid/content/Context;)Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    invoke-virtual {p3}, Lcom/android/launcher3/util/Z$c;->t()Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-ne p1, v1, :cond_0

    .line 90
    .line 91
    iget p1, p2, Landroid/content/res/Configuration;->orientation:I

    .line 92
    .line 93
    iget v1, p0, Lcom/android/launcher3/util/Z;->n:I

    .line 94
    .line 95
    if-eq p1, v1, :cond_1

    .line 96
    .line 97
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 100
    .line 101
    .line 102
    const-string v1, "onConfigurationChanged config.navigation:"

    .line 103
    .line 104
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    iget v1, p2, Landroid/content/res/Configuration;->navigation:I

    .line 108
    .line 109
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    const-string v1, " rotation "

    .line 113
    .line 114
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    iget v0, v0, Lcom/android/launcher3/util/window/a;->b:I

    .line 118
    .line 119
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    const-string v0, "-"

    .line 123
    .line 124
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Lcom/android/launcher3/util/Z;->g:Lcom/android/launcher3/util/window/d;

    .line 128
    .line 129
    iget-object p4, p4, Lcom/android/launcher3/util/Z$d;->i:Landroid/content/Context;

    .line 130
    .line 131
    invoke-virtual {v0, p4}, Lcom/android/launcher3/util/window/d;->getRotation(Landroid/content/Context;)I

    .line 132
    .line 133
    .line 134
    move-result p4

    .line 135
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    const-string p4, "DisplayController"

    .line 143
    .line 144
    invoke-static {p4, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    .line 146
    .line 147
    invoke-virtual {p0}, Lcom/android/launcher3/util/Z;->K()V

    .line 148
    .line 149
    .line 150
    iput-boolean v3, p0, Lcom/android/launcher3/util/Z;->m:Z

    .line 151
    .line 152
    iget p1, p2, Landroid/content/res/Configuration;->orientation:I

    .line 153
    .line 154
    iput p1, p0, Lcom/android/launcher3/util/Z;->n:I

    .line 155
    .line 156
    :cond_1
    iget p1, p2, Landroid/content/res/Configuration;->uiMode:I

    .line 157
    .line 158
    iget p2, p3, Lcom/android/launcher3/util/Z$c;->q:I

    .line 159
    .line 160
    if-eq p1, p2, :cond_2

    .line 161
    .line 162
    iput-boolean v3, p0, Lcom/android/launcher3/util/Z;->o:Z

    .line 163
    .line 164
    iput p1, p3, Lcom/android/launcher3/util/Z$c;->q:I

    .line 165
    .line 166
    :cond_2
    return-void
.end method

.method private synthetic J()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/Z;->j:Landroid/util/SparseArray;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lcom/android/launcher3/util/Z$d;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/android/launcher3/util/Z$d;->i:Landroid/content/Context;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-static {v0, v2, v1}, Lx1/O;->D(Landroid/content/Context;Landroid/content/res/Resources;Z)V

    .line 17
    .line 18
    .line 19
    sget-object v2, Lcom/android/launcher3/util/window/d;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 20
    .line 21
    invoke-virtual {v2, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Lcom/android/launcher3/util/window/d;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/Z;->v(Landroid/content/Context;)Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v2, v0}, Lcom/android/launcher3/util/window/d;->getDisplayInfo(Landroid/content/Context;)Lcom/android/launcher3/util/window/a;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget v0, v0, Lcom/android/launcher3/util/window/a;->b:I

    .line 36
    .line 37
    new-instance v2, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 40
    .line 41
    .line 42
    const-string v3, "updateDisplayinfo: "

    .line 43
    .line 44
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v3, "-oldrotation: "

    .line 51
    .line 52
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    iget-object v3, p0, Lcom/android/launcher3/util/Z;->j:Landroid/util/SparseArray;

    .line 56
    .line 57
    invoke-virtual {v3, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    check-cast v3, Lcom/android/launcher3/util/Z$d;

    .line 62
    .line 63
    iget-object v3, v3, Lcom/android/launcher3/util/Z$d;->j:Lcom/android/launcher3/util/Z$c;

    .line 64
    .line 65
    iget v3, v3, Lcom/android/launcher3/util/Z$c;->b:I

    .line 66
    .line 67
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    const-string v3, "DisplayController"

    .line 75
    .line 76
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    iget-object v2, p0, Lcom/android/launcher3/util/Z;->j:Landroid/util/SparseArray;

    .line 80
    .line 81
    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    check-cast v1, Lcom/android/launcher3/util/Z$d;

    .line 86
    .line 87
    iget-object v1, v1, Lcom/android/launcher3/util/Z$d;->j:Lcom/android/launcher3/util/Z$c;

    .line 88
    .line 89
    iget v1, v1, Lcom/android/launcher3/util/Z$c;->b:I

    .line 90
    .line 91
    if-eq v0, v1, :cond_0

    .line 92
    .line 93
    invoke-virtual {p0}, Lcom/android/launcher3/util/Z;->K()V

    .line 94
    .line 95
    .line 96
    :cond_0
    return-void
.end method

.method private N(Landroid/content/res/Configuration;I)V
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "DisplayController#onConfigurationChanged: "

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
    const-string v1, "uiMode="

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    iget v1, p1, Landroid/content/res/Configuration;->uiMode:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "b/254119092"

    .line 29
    .line 30
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/android/launcher3/util/Z;->j:Landroid/util/SparseArray;

    .line 34
    .line 35
    invoke-virtual {v0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    move-object v5, p2

    .line 40
    check-cast v5, Lcom/android/launcher3/util/Z$d;

    .line 41
    .line 42
    iget-object v2, v5, Lcom/android/launcher3/util/Z$d;->i:Landroid/content/Context;

    .line 43
    .line 44
    iget-object v4, v5, Lcom/android/launcher3/util/Z$d;->j:Lcom/android/launcher3/util/Z$c;

    .line 45
    .line 46
    sget-object p2, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 47
    .line 48
    new-instance v0, Lcom/android/launcher3/util/T;

    .line 49
    .line 50
    move-object v1, p0

    .line 51
    move-object v3, p1

    .line 52
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/util/T;-><init>(Lcom/android/launcher3/util/Z;Landroid/content/Context;Landroid/content/res/Configuration;Lcom/android/launcher3/util/Z$c;Lcom/android/launcher3/util/Z$d;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p2, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method private O(Landroid/content/Intent;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/util/Z;->l:Z

    .line 2
    .line 3
    const-string v1, "DisplayController"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance p1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v0, "onIntent mDestroyed:"

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    iget-boolean p0, p0, Lcom/android/launcher3/util/Z;->l:Z

    .line 18
    .line 19
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    const-string v0, "android.intent.action.OVERLAY_CHANGED"

    .line 31
    .line 32
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_1

    .line 41
    .line 42
    const-string p1, "Overlay changed, notifying listeners"

    .line 43
    .line 44
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    const/4 p1, 0x0

    .line 48
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/Z;->L(I)V

    .line 49
    .line 50
    .line 51
    :cond_1
    return-void
.end method

.method public static T(Landroid/content/Context;)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/util/Z;->r:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/util/Z;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/util/Z;->w()Lcom/android/launcher3/util/Z$c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/util/Z$c;->t()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public static U(Landroid/content/Context;)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/util/Z;->r:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/util/Z;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/util/Z;->w()Lcom/android/launcher3/util/Z$c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/util/Z$c;->u()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public static synthetic a(Lcom/android/launcher3/util/Z;Landroid/content/Context;Landroid/content/res/Configuration;Lcom/android/launcher3/util/Z$c;Lcom/android/launcher3/util/Z$d;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/launcher3/util/Z;->I(Landroid/content/Context;Landroid/content/res/Configuration;Lcom/android/launcher3/util/Z$c;Lcom/android/launcher3/util/Z$d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ljava/io/PrintWriter;Lcom/android/launcher3/util/window/a;Ljava/util/List;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "  perDisplayBounds - "

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
    const-string p1, ": "

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/util/Z;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/util/Z;->O(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/util/Z;Landroid/hardware/display/DisplayManager;Landroid/view/Display;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/util/Z;->F(Landroid/hardware/display/DisplayManager;Landroid/view/Display;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/util/Z;Lcom/android/launcher3/util/Z$d;Lcom/android/launcher3/util/window/d;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/util/Z;->G(Lcom/android/launcher3/util/Z$d;Lcom/android/launcher3/util/window/d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/android/launcher3/util/Z;Lcom/android/launcher3/util/Z$d;Lcom/android/launcher3/util/Z$c;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/launcher3/util/Z;->H(Lcom/android/launcher3/util/Z$d;Lcom/android/launcher3/util/Z$c;II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Landroid/hardware/display/DisplayManager;Landroid/hardware/display/DisplayManager$DisplayListener;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/hardware/display/DisplayManager;->unregisterDisplayListener(Landroid/hardware/display/DisplayManager$DisplayListener;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Lcom/android/launcher3/util/Z;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/util/Z;->J()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Lcom/android/launcher3/util/Z;Lcom/android/launcher3/J3;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/util/Z;->E(Lcom/android/launcher3/J3;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j(Lcom/android/launcher3/J3;Lcom/android/launcher3/F3;)V
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [Lcom/android/launcher3/H1;

    .line 3
    .line 4
    sget-object v1, Lcom/android/launcher3/J3;->j:Lcom/android/launcher3/X;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    aput-object v1, v0, v2

    .line 8
    .line 9
    sget-object v1, Lcom/android/launcher3/J3;->k:Lcom/android/launcher3/X;

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    aput-object v1, v0, v2

    .line 13
    .line 14
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/J3;->x(Lcom/android/launcher3/F3;[Lcom/android/launcher3/H1;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method static bridge synthetic k(Lcom/android/launcher3/util/Z;Landroid/view/Display;)Lcom/android/launcher3/util/Z$d;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/util/Z;->A(Landroid/view/Display;)Lcom/android/launcher3/util/Z$d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic l(Lcom/android/launcher3/util/Z;Landroid/content/res/Configuration;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/util/Z;->N(Landroid/content/res/Configuration;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic m()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/android/launcher3/util/Z;->p:Z

    .line 2
    .line 3
    return v0
.end method

.method static bridge synthetic n()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/android/launcher3/util/Z;->q:Z

    .line 2
    .line 3
    return v0
.end method

.method private q(Lcom/android/launcher3/util/Z$c;Lcom/android/launcher3/util/Z$c;)I
    .locals 4

    .line 1
    iget-object v0, p2, Lcom/android/launcher3/util/Z$c;->a:Lcom/android/launcher3/util/window/a;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/android/launcher3/util/Z$c;->a:Lcom/android/launcher3/util/window/a;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/window/a;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    xor-int/lit8 v0, v0, 0x1

    .line 10
    .line 11
    iget v1, p2, Lcom/android/launcher3/util/Z$c;->b:I

    .line 12
    .line 13
    iget v2, p1, Lcom/android/launcher3/util/Z$c;->b:I

    .line 14
    .line 15
    if-eq v1, v2, :cond_0

    .line 16
    .line 17
    or-int/lit8 v0, v0, 0x2

    .line 18
    .line 19
    :cond_0
    invoke-static {p2}, Lcom/android/launcher3/util/Z$c;->c(Lcom/android/launcher3/util/Z$c;)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-static {p1}, Lcom/android/launcher3/util/Z$c;->c(Lcom/android/launcher3/util/Z$c;)I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-ne v1, v2, :cond_1

    .line 28
    .line 29
    iget v1, p2, Lcom/android/launcher3/util/Z$c;->e:F

    .line 30
    .line 31
    iget v2, p1, Lcom/android/launcher3/util/Z$c;->e:F

    .line 32
    .line 33
    cmpl-float v1, v1, v2

    .line 34
    .line 35
    if-eqz v1, :cond_2

    .line 36
    .line 37
    :cond_1
    or-int/lit8 v0, v0, 0x4

    .line 38
    .line 39
    :cond_2
    invoke-virtual {p2}, Lcom/android/launcher3/util/Z$c;->n()Lcom/android/launcher3/util/C1;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {p1}, Lcom/android/launcher3/util/Z$c;->n()Lcom/android/launcher3/util/C1;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    if-eq v1, v2, :cond_3

    .line 48
    .line 49
    or-int/lit8 v0, v0, 0x10

    .line 50
    .line 51
    :cond_3
    iget-object v1, p2, Lcom/android/launcher3/util/Z$c;->j:Ljava/util/Set;

    .line 52
    .line 53
    iget-object v2, p1, Lcom/android/launcher3/util/Z$c;->j:Ljava/util/Set;

    .line 54
    .line 55
    invoke-interface {v1, v2}, Ljava/util/Set;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    const-string v2, "DisplayController"

    .line 60
    .line 61
    if-eqz v1, :cond_4

    .line 62
    .line 63
    invoke-static {p2}, Lcom/android/launcher3/util/Z$c;->g(Lcom/android/launcher3/util/Z$c;)Lx1/u;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-static {p1}, Lcom/android/launcher3/util/Z$c;->g(Lcom/android/launcher3/util/Z$c;)Lx1/u;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-virtual {v1, v3}, Lx1/u;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-nez v1, :cond_6

    .line 76
    .line 77
    :cond_4
    new-instance v1, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 80
    .line 81
    .line 82
    const-string v3, "handleInfoChange CHANGE_SUPPORTED_BOUNDS oldInfo.supportedBounds="

    .line 83
    .line 84
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    iget-object v3, p1, Lcom/android/launcher3/util/Z$c;->j:Ljava/util/Set;

    .line 88
    .line 89
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    const-string v3, " oldInfo.mPerDisplayBounds="

    .line 93
    .line 94
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-static {p1}, Lcom/android/launcher3/util/Z$c;->g(Lcom/android/launcher3/util/Z$c;)Lx1/u;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    .line 110
    .line 111
    new-instance v1, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 114
    .line 115
    .line 116
    const-string v3, "handleInfoChange CHANGE_SUPPORTED_BOUNDS newInfo.supportedBounds="

    .line 117
    .line 118
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    iget-object v3, p2, Lcom/android/launcher3/util/Z$c;->j:Ljava/util/Set;

    .line 122
    .line 123
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    const-string v3, " newInfo.mPerDisplayBounds="

    .line 127
    .line 128
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-static {p2}, Lcom/android/launcher3/util/Z$c;->g(Lcom/android/launcher3/util/Z$c;)Lx1/u;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    .line 144
    .line 145
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    if-eqz v1, :cond_5

    .line 150
    .line 151
    iget v1, p2, Lcom/android/launcher3/util/Z$c;->b:I

    .line 152
    .line 153
    iget v3, p1, Lcom/android/launcher3/util/Z$c;->b:I

    .line 154
    .line 155
    if-eq v1, v3, :cond_5

    .line 156
    .line 157
    iget-object v1, p2, Lcom/android/launcher3/util/Z$c;->j:Ljava/util/Set;

    .line 158
    .line 159
    iget-object v3, p1, Lcom/android/launcher3/util/Z$c;->j:Ljava/util/Set;

    .line 160
    .line 161
    invoke-interface {v1, v3}, Ljava/util/Set;->equals(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result v1

    .line 165
    if-eqz v1, :cond_5

    .line 166
    .line 167
    invoke-static {p2}, Lcom/android/launcher3/util/Z$c;->g(Lcom/android/launcher3/util/Z$c;)Lx1/u;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    invoke-static {p1}, Lcom/android/launcher3/util/Z$c;->g(Lcom/android/launcher3/util/Z$c;)Lx1/u;

    .line 172
    .line 173
    .line 174
    move-result-object v3

    .line 175
    invoke-direct {p0, v1, v3}, Lcom/android/launcher3/util/Z;->r(Lx1/u;Lx1/u;)Z

    .line 176
    .line 177
    .line 178
    move-result v1

    .line 179
    if-eqz v1, :cond_5

    .line 180
    .line 181
    const-string v1, "handleInfoChange: ignore rotation change when tablet."

    .line 182
    .line 183
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    .line 185
    .line 186
    goto :goto_0

    .line 187
    :cond_5
    or-int/lit8 v0, v0, 0x8

    .line 188
    .line 189
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 190
    .line 191
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 192
    .line 193
    .line 194
    const-string v3, "(CHANGE_SUPPORTED_BOUNDS) perDisplayBounds: "

    .line 195
    .line 196
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    invoke-static {p2}, Lcom/android/launcher3/util/Z$c;->g(Lcom/android/launcher3/util/Z$c;)Lx1/u;

    .line 200
    .line 201
    .line 202
    move-result-object v3

    .line 203
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v1

    .line 210
    invoke-static {v2, v1}, Lcom/android/launcher3/logging/b;->o(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    :cond_6
    invoke-static {p2}, Lcom/android/launcher3/util/Z$c;->e(Lcom/android/launcher3/util/Z$c;)Z

    .line 214
    .line 215
    .line 216
    move-result v1

    .line 217
    invoke-static {p1}, Lcom/android/launcher3/util/Z$c;->e(Lcom/android/launcher3/util/Z$c;)Z

    .line 218
    .line 219
    .line 220
    move-result v3

    .line 221
    if-ne v1, v3, :cond_7

    .line 222
    .line 223
    invoke-static {p2}, Lcom/android/launcher3/util/Z$c;->f(Lcom/android/launcher3/util/Z$c;)Z

    .line 224
    .line 225
    .line 226
    move-result v1

    .line 227
    invoke-static {p1}, Lcom/android/launcher3/util/Z$c;->f(Lcom/android/launcher3/util/Z$c;)Z

    .line 228
    .line 229
    .line 230
    move-result v3

    .line 231
    if-ne v1, v3, :cond_7

    .line 232
    .line 233
    invoke-virtual {p2}, Lcom/android/launcher3/util/Z$c;->p()Z

    .line 234
    .line 235
    .line 236
    move-result v1

    .line 237
    invoke-virtual {p1}, Lcom/android/launcher3/util/Z$c;->p()Z

    .line 238
    .line 239
    .line 240
    move-result v3

    .line 241
    if-eq v1, v3, :cond_8

    .line 242
    .line 243
    :cond_7
    or-int/lit8 v0, v0, 0x20

    .line 244
    .line 245
    :cond_8
    invoke-static {p2}, Lcom/android/launcher3/util/Z$c;->d(Lcom/android/launcher3/util/Z$c;)Z

    .line 246
    .line 247
    .line 248
    move-result v1

    .line 249
    invoke-static {p1}, Lcom/android/launcher3/util/Z$c;->d(Lcom/android/launcher3/util/Z$c;)Z

    .line 250
    .line 251
    .line 252
    move-result v3

    .line 253
    if-eq v1, v3, :cond_9

    .line 254
    .line 255
    or-int/lit8 v0, v0, 0x40

    .line 256
    .line 257
    :cond_9
    invoke-static {p2}, Lcom/android/launcher3/util/Z$c;->i(Lcom/android/launcher3/util/Z$c;)Z

    .line 258
    .line 259
    .line 260
    move-result p2

    .line 261
    invoke-static {p1}, Lcom/android/launcher3/util/Z$c;->i(Lcom/android/launcher3/util/Z$c;)Z

    .line 262
    .line 263
    .line 264
    move-result p1

    .line 265
    if-eq p2, p1, :cond_a

    .line 266
    .line 267
    or-int/lit16 v0, v0, 0x80

    .line 268
    .line 269
    :cond_a
    new-instance p1, Ljava/lang/StringBuilder;

    .line 270
    .line 271
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 272
    .line 273
    .line 274
    const-string p2, "handleInfoChange - change: "

    .line 275
    .line 276
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 277
    .line 278
    .line 279
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/Z;->u(I)Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object p0

    .line 283
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 284
    .line 285
    .line 286
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 287
    .line 288
    .line 289
    move-result-object p0

    .line 290
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 291
    .line 292
    .line 293
    return v0
.end method

.method private r(Lx1/u;Lx1/u;)Z
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lx1/u<",
            "Lcom/android/launcher3/util/window/a;",
            "Ljava/util/List<",
            "Lcom/android/launcher3/util/p3;",
            ">;>;",
            "Lx1/u<",
            "Lcom/android/launcher3/util/window/a;",
            "Ljava/util/List<",
            "Lcom/android/launcher3/util/p3;",
            ">;>;)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lo/r;->size()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-virtual {p2}, Lo/r;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eq p0, v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    move p0, v1

    .line 14
    :goto_0
    :try_start_0
    invoke-virtual {p1}, Lo/r;->size()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-ge p0, v0, :cond_7

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Lo/r;->f(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/android/launcher3/util/window/a;

    .line 25
    .line 26
    invoke-virtual {p1, p0}, Lo/r;->j(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Ljava/util/List;

    .line 31
    .line 32
    invoke-virtual {p2, v0}, Lo/a;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    check-cast v3, Ljava/util/List;

    .line 37
    .line 38
    if-nez v2, :cond_2

    .line 39
    .line 40
    if-nez v3, :cond_1

    .line 41
    .line 42
    invoke-virtual {p2, v0}, Lo/a;->containsKey(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_6

    .line 47
    .line 48
    :cond_1
    return v1

    .line 49
    :cond_2
    if-eqz v3, :cond_6

    .line 50
    .line 51
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    if-eq v0, v4, :cond_3

    .line 60
    .line 61
    return v1

    .line 62
    :cond_3
    move v0, v1

    .line 63
    :goto_1
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    if-ge v0, v4, :cond_6

    .line 68
    .line 69
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    check-cast v4, Lcom/android/launcher3/util/p3;

    .line 74
    .line 75
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    check-cast v5, Lcom/android/launcher3/util/p3;

    .line 80
    .line 81
    invoke-virtual {v4, v5}, Lcom/android/launcher3/util/p3;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v6

    .line 85
    if-eqz v6, :cond_4

    .line 86
    .line 87
    goto :goto_2

    .line 88
    :cond_4
    iget-object v6, v4, Lcom/android/launcher3/util/p3;->a:Landroid/graphics/Rect;

    .line 89
    .line 90
    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    .line 91
    .line 92
    .line 93
    move-result v6

    .line 94
    iget-object v7, v5, Lcom/android/launcher3/util/p3;->a:Landroid/graphics/Rect;

    .line 95
    .line 96
    invoke-virtual {v7}, Landroid/graphics/Rect;->height()I

    .line 97
    .line 98
    .line 99
    move-result v7

    .line 100
    if-ne v6, v7, :cond_5

    .line 101
    .line 102
    iget-object v6, v4, Lcom/android/launcher3/util/p3;->a:Landroid/graphics/Rect;

    .line 103
    .line 104
    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    .line 105
    .line 106
    .line 107
    move-result v6

    .line 108
    iget-object v7, v5, Lcom/android/launcher3/util/p3;->a:Landroid/graphics/Rect;

    .line 109
    .line 110
    invoke-virtual {v7}, Landroid/graphics/Rect;->width()I

    .line 111
    .line 112
    .line 113
    move-result v7

    .line 114
    if-ne v6, v7, :cond_5

    .line 115
    .line 116
    iget-object v4, v4, Lcom/android/launcher3/util/p3;->b:Landroid/graphics/Rect;

    .line 117
    .line 118
    iget-object v5, v5, Lcom/android/launcher3/util/p3;->b:Landroid/graphics/Rect;

    .line 119
    .line 120
    invoke-virtual {v4, v5}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 124
    if-eqz v4, :cond_5

    .line 125
    .line 126
    :goto_2
    add-int/lit8 v0, v0, 0x1

    .line 127
    .line 128
    goto :goto_1

    .line 129
    :cond_5
    return v1

    .line 130
    :cond_6
    add-int/lit8 p0, p0, 0x1

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_7
    const/4 p0, 0x1

    .line 134
    return p0

    .line 135
    :catch_0
    return v1
.end method

.method public static t(Z)V
    .locals 0

    .line 1
    sput-boolean p0, Lcom/android/launcher3/util/Z;->q:Z

    .line 2
    .line 3
    return-void
.end method

.method public static y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/util/Z;->r:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/util/Z;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/util/Z;->w()Lcom/android/launcher3/util/Z$c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/util/Z$c;->n()Lcom/android/launcher3/util/C1;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method private z(Lcom/android/launcher3/util/Z$c;Landroid/content/Context;)Lcom/android/launcher3/util/Z$c;
    .locals 3

    .line 1
    new-instance v0, Lcom/android/launcher3/util/Z$c;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/util/Z;->g:Lcom/android/launcher3/util/window/d;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/android/launcher3/util/Z$c;->g(Lcom/android/launcher3/util/Z$c;)Lx1/u;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-direct {v0, p2, v1, v2}, Lcom/android/launcher3/util/Z$c;-><init>(Landroid/content/Context;Lcom/android/launcher3/util/window/d;Ljava/util/Map;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Lcom/android/launcher3/util/Z$c;->c(Lcom/android/launcher3/util/Z$c;)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-static {p1}, Lcom/android/launcher3/util/Z$c;->c(Lcom/android/launcher3/util/Z$c;)I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-ne v1, v2, :cond_1

    .line 21
    .line 22
    iget v1, v0, Lcom/android/launcher3/util/Z$c;->e:F

    .line 23
    .line 24
    iget v2, p1, Lcom/android/launcher3/util/Z$c;->e:F

    .line 25
    .line 26
    cmpl-float v1, v1, v2

    .line 27
    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/android/launcher3/util/Z$c;->n()Lcom/android/launcher3/util/C1;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {p1}, Lcom/android/launcher3/util/Z$c;->n()Lcom/android/launcher3/util/C1;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    if-eq v1, p1, :cond_0

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    return-object v0

    .line 42
    :cond_1
    :goto_0
    new-instance p1, Lcom/android/launcher3/util/Z$c;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/android/launcher3/util/Z;->g:Lcom/android/launcher3/util/window/d;

    .line 45
    .line 46
    invoke-virtual {p0, p2}, Lcom/android/launcher3/util/window/d;->estimateInternalDisplayBounds(Landroid/content/Context;)Landroid/util/ArrayMap;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-direct {p1, p2, p0, v0}, Lcom/android/launcher3/util/Z$c;-><init>(Landroid/content/Context;Lcom/android/launcher3/util/window/d;Ljava/util/Map;)V

    .line 51
    .line 52
    .line 53
    return-object p1
.end method


# virtual methods
.method public K()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/Z;->L(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public L(I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/Z;->M(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public M(I)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/Z;->j:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    move-object v3, v0

    .line 8
    check-cast v3, Lcom/android/launcher3/util/Z$d;

    .line 9
    .line 10
    if-nez v3, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object v0, v3, Lcom/android/launcher3/util/Z$d;->j:Lcom/android/launcher3/util/Z$c;

    .line 14
    .line 15
    iget-object v1, v3, Lcom/android/launcher3/util/Z$d;->i:Landroid/content/Context;

    .line 16
    .line 17
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    const/4 v4, 0x0

    .line 22
    invoke-static {v1, v2, v4}, Lx1/O;->D(Landroid/content/Context;Landroid/content/res/Resources;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v1, v3, Lcom/android/launcher3/util/Z$d;->i:Landroid/content/Context;

    .line 26
    .line 27
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/util/Z;->z(Lcom/android/launcher3/util/Z$c;Landroid/content/Context;)Lcom/android/launcher3/util/Z$c;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    invoke-direct {p0, v0, v4}, Lcom/android/launcher3/util/Z;->q(Lcom/android/launcher3/util/Z$c;Lcom/android/launcher3/util/Z$c;)I

    .line 32
    .line 33
    .line 34
    move-result v6

    .line 35
    if-eqz v6, :cond_1

    .line 36
    .line 37
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 38
    .line 39
    new-instance v1, Lcom/android/launcher3/util/Q;

    .line 40
    .line 41
    move-object v2, p0

    .line 42
    move v5, p1

    .line 43
    invoke-direct/range {v1 .. v6}, Lcom/android/launcher3/util/Q;-><init>(Lcom/android/launcher3/util/Z;Lcom/android/launcher3/util/Z$d;Lcom/android/launcher3/util/Z$c;II)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 47
    .line 48
    .line 49
    :cond_1
    :goto_0
    return-void
.end method

.method public P(Lcom/android/launcher3/util/Z$b;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/util/Z;->Q(Lcom/android/launcher3/util/Z$b;I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public Q(Lcom/android/launcher3/util/Z$b;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/Z;->j:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/util/Z$d;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/Z$d;->d(Lcom/android/launcher3/util/Z$b;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method R(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/Z;->j:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/launcher3/util/Z$d;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/util/Z$d;->b()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/util/Z;->j:Landroid/util/SparseArray;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->remove(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public S(Lcom/android/launcher3/util/Z$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/util/Z;->i:Lcom/android/launcher3/util/Z$b;

    .line 2
    .line 3
    return-void
.end method

.method public V()V
    .locals 2

    .line 1
    sget-boolean v0, Lcom/android/launcher3/N5;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 6
    .line 7
    new-instance v1, Lcom/android/launcher3/util/S;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Lcom/android/launcher3/util/S;-><init>(Lcom/android/launcher3/util/Z;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public o(Lcom/android/launcher3/util/Z$b;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/util/Z;->p(Lcom/android/launcher3/util/Z$b;I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public onIsInDesktopModeChanged(IZ)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/Z;->L(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public p(Lcom/android/launcher3/util/Z$b;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/Z;->j:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/util/Z$d;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/Z$d;->a(Lcom/android/launcher3/util/Z$b;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public s(Ljava/io/PrintWriter;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/Z;->j:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_1

    .line 9
    .line 10
    iget-object v2, p0, Lcom/android/launcher3/util/Z;->j:Landroid/util/SparseArray;

    .line 11
    .line 12
    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->keyAt(I)I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    invoke-virtual {p0, v2}, Lcom/android/launcher3/util/Z;->x(I)Lcom/android/launcher3/util/Z$c;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    if-nez v3, :cond_0

    .line 21
    .line 22
    goto/16 :goto_1

    .line 23
    .line 24
    :cond_0
    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 25
    .line 26
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    const-string v5, "DisplayController.Info (displayId=%d):"

    .line 35
    .line 36
    invoke-static {v4, v5, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    new-instance v2, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .line 47
    .line 48
    const-string v4, "  normalizedDisplayInfo="

    .line 49
    .line 50
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    iget-object v4, v3, Lcom/android/launcher3/util/Z$c;->a:Lcom/android/launcher3/util/window/a;

    .line 54
    .line 55
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    new-instance v2, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 68
    .line 69
    .line 70
    const-string v4, "  rotation="

    .line 71
    .line 72
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    iget v4, v3, Lcom/android/launcher3/util/Z$c;->b:I

    .line 76
    .line 77
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    new-instance v2, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 90
    .line 91
    .line 92
    const-string v4, "  fontScale="

    .line 93
    .line 94
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    iget v4, v3, Lcom/android/launcher3/util/Z$c;->e:F

    .line 98
    .line 99
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    new-instance v2, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 112
    .line 113
    .line 114
    const-string v4, "  densityDpi="

    .line 115
    .line 116
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-static {v3}, Lcom/android/launcher3/util/Z$c;->c(Lcom/android/launcher3/util/Z$c;)I

    .line 120
    .line 121
    .line 122
    move-result v4

    .line 123
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    new-instance v2, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 136
    .line 137
    .line 138
    const-string v4, "  navigationMode="

    .line 139
    .line 140
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v3}, Lcom/android/launcher3/util/Z$c;->n()Lcom/android/launcher3/util/C1;

    .line 144
    .line 145
    .line 146
    move-result-object v4

    .line 147
    invoke-virtual {v4}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v4

    .line 151
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    new-instance v2, Ljava/lang/StringBuilder;

    .line 162
    .line 163
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 164
    .line 165
    .line 166
    const-string v4, "  isTaskbarPinned="

    .line 167
    .line 168
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    invoke-static {v3}, Lcom/android/launcher3/util/Z$c;->e(Lcom/android/launcher3/util/Z$c;)Z

    .line 172
    .line 173
    .line 174
    move-result v4

    .line 175
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    new-instance v2, Ljava/lang/StringBuilder;

    .line 186
    .line 187
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 188
    .line 189
    .line 190
    const-string v4, "  isTaskbarPinnedInDesktopMode="

    .line 191
    .line 192
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    invoke-static {v3}, Lcom/android/launcher3/util/Z$c;->f(Lcom/android/launcher3/util/Z$c;)Z

    .line 196
    .line 197
    .line 198
    move-result v4

    .line 199
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v2

    .line 206
    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    new-instance v2, Ljava/lang/StringBuilder;

    .line 210
    .line 211
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 212
    .line 213
    .line 214
    const-string v4, "  isInDesktopMode="

    .line 215
    .line 216
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    invoke-static {v3}, Lcom/android/launcher3/util/Z$c;->d(Lcom/android/launcher3/util/Z$c;)Z

    .line 220
    .line 221
    .line 222
    move-result v4

    .line 223
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 224
    .line 225
    .line 226
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v2

    .line 230
    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 231
    .line 232
    .line 233
    new-instance v2, Ljava/lang/StringBuilder;

    .line 234
    .line 235
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 236
    .line 237
    .line 238
    const-string v4, "  showLockedTaskbarOnHome="

    .line 239
    .line 240
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    invoke-virtual {v3}, Lcom/android/launcher3/util/Z$c;->u()Z

    .line 244
    .line 245
    .line 246
    move-result v4

    .line 247
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 248
    .line 249
    .line 250
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object v2

    .line 254
    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 255
    .line 256
    .line 257
    new-instance v2, Ljava/lang/StringBuilder;

    .line 258
    .line 259
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 260
    .line 261
    .line 262
    const-string v4, "  currentSize="

    .line 263
    .line 264
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 265
    .line 266
    .line 267
    iget-object v4, v3, Lcom/android/launcher3/util/Z$c;->c:Landroid/graphics/Point;

    .line 268
    .line 269
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object v2

    .line 276
    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 277
    .line 278
    .line 279
    invoke-static {v3}, Lcom/android/launcher3/util/Z$c;->g(Lcom/android/launcher3/util/Z$c;)Lx1/u;

    .line 280
    .line 281
    .line 282
    move-result-object v2

    .line 283
    new-instance v4, Lcom/android/launcher3/util/N;

    .line 284
    .line 285
    invoke-direct {v4, p1}, Lcom/android/launcher3/util/N;-><init>(Ljava/io/PrintWriter;)V

    .line 286
    .line 287
    .line 288
    invoke-interface {v2, v4}, Ljava/util/Map;->forEach(Ljava/util/function/BiConsumer;)V

    .line 289
    .line 290
    .line 291
    new-instance v2, Ljava/lang/StringBuilder;

    .line 292
    .line 293
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 294
    .line 295
    .line 296
    const-string v4, "  isTransientTaskbar="

    .line 297
    .line 298
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 299
    .line 300
    .line 301
    invoke-virtual {v3}, Lcom/android/launcher3/util/Z$c;->r()Z

    .line 302
    .line 303
    .line 304
    move-result v3

    .line 305
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 306
    .line 307
    .line 308
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 309
    .line 310
    .line 311
    move-result-object v2

    .line 312
    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 313
    .line 314
    .line 315
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 316
    .line 317
    goto/16 :goto_0

    .line 318
    .line 319
    :cond_1
    return-void
.end method

.method public u(I)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance p0, Ljava/util/StringJoiner;

    .line 2
    .line 3
    const-string v0, "|"

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/util/StringJoiner;-><init>(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    const-string v1, "CHANGE_ACTIVE_SCREEN"

    .line 10
    .line 11
    invoke-static {p0, p1, v0, v1}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x2

    .line 15
    const-string v1, "CHANGE_ROTATION"

    .line 16
    .line 17
    invoke-static {p0, p1, v0, v1}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x4

    .line 21
    const-string v1, "CHANGE_DENSITY"

    .line 22
    .line 23
    invoke-static {p0, p1, v0, v1}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/16 v0, 0x8

    .line 27
    .line 28
    const-string v1, "CHANGE_SUPPORTED_BOUNDS"

    .line 29
    .line 30
    invoke-static {p0, p1, v0, v1}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const/16 v0, 0x10

    .line 34
    .line 35
    const-string v1, "CHANGE_NAVIGATION_MODE"

    .line 36
    .line 37
    invoke-static {p0, p1, v0, v1}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 38
    .line 39
    .line 40
    const/16 v0, 0x20

    .line 41
    .line 42
    const-string v1, "CHANGE_TASKBAR_VARIANT"

    .line 43
    .line 44
    invoke-static {p0, p1, v0, v1}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    const/16 v0, 0x40

    .line 48
    .line 49
    const-string v1, "CHANGE_DESKTOP_MODE"

    .line 50
    .line 51
    invoke-static {p0, p1, v0, v1}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 52
    .line 53
    .line 54
    const/16 v0, 0x80

    .line 55
    .line 56
    const-string v1, "CHANGE_SHOW_LOCKED_TASKBAR"

    .line 57
    .line 58
    invoke-static {p0, p1, v0, v1}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Ljava/util/StringJoiner;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0
.end method

.method public v(Landroid/content/Context;)Landroid/content/Context;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/Z;->j:Landroid/util/SparseArray;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lcom/android/launcher3/util/Z$d;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/util/Z$d;->i:Landroid/content/Context;

    .line 11
    .line 12
    sget-boolean v1, Lcom/android/launcher3/N5;->e:Z

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-static {}, Lx1/O;->c2()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    move-object p1, p0

    .line 25
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p1, p0, v0}, Lx1/O;->D(Landroid/content/Context;Landroid/content/res/Resources;Z)V

    .line 30
    .line 31
    .line 32
    return-object p1
.end method

.method public w()Lcom/android/launcher3/util/Z$c;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/Z;->j:Landroid/util/SparseArray;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lcom/android/launcher3/util/Z$d;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/util/Z$d;->j:Lcom/android/launcher3/util/Z$c;

    .line 11
    .line 12
    return-object p0
.end method

.method public x(I)Lcom/android/launcher3/util/Z$c;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->M()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/util/Z;->j:Landroid/util/SparseArray;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/android/launcher3/util/Z$d;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/launcher3/util/Z$d;->j:Lcom/android/launcher3/util/Z$c;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return-object p0

    .line 22
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/util/Z;->w()Lcom/android/launcher3/util/Z$c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method
