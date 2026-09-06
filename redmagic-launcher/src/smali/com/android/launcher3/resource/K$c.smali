.class Lcom/android/launcher3/resource/K$c;
.super Ljava/lang/Object;
.source "MenuResource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/resource/K;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "c"
.end annotation


# instance fields
.field private a:Ljava/lang/String;

.field private b:Ljava/lang/String;

.field private c:Ljava/lang/String;

.field private d:I

.field private e:I

.field private f:I

.field private g:Z

.field private h:Z

.field private i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/resource/g0$h;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/android/launcher3/resource/K$c;->d:I

    .line 6
    .line 7
    iput v0, p0, Lcom/android/launcher3/resource/K$c;->e:I

    .line 8
    .line 9
    iput v0, p0, Lcom/android/launcher3/resource/K$c;->f:I

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/android/launcher3/resource/K$c;->g:Z

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Lcom/android/launcher3/resource/K$c;->h:Z

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method a(Lcom/android/launcher3/resource/g0$h;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/K$c;->i:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/launcher3/resource/K$c;->i:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/resource/K$c;->i:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method b()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/K$c;->i:Ljava/util/List;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method c()I
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/launcher3/resource/K$c;->d:I

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/high16 v0, -0x1000000

    .line 6
    .line 7
    or-int/2addr p0, v0

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, -0x1

    .line 10
    return p0
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/resource/K$c;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method e()I
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/launcher3/resource/K$c;->e:I

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/high16 v0, -0x1000000

    .line 6
    .line 7
    or-int/2addr p0, v0

    .line 8
    return p0

    .line 9
    :cond_0
    const p0, -0xccb99a

    .line 10
    .line 11
    .line 12
    return p0
.end method

.method f()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/K$c;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method g()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/K$c;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method h()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/K$c;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method i()I
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/launcher3/resource/K$c;->f:I

    .line 2
    .line 3
    const/high16 v0, -0x1000000

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    or-int/2addr p0, v0

    .line 8
    return p0

    .line 9
    :cond_0
    return v0
.end method

.method j()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/resource/K$c;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method k(IZ)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "setForeColor  foreColor :"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "R-Loader"

    .line 23
    .line 24
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    iget v0, p0, Lcom/android/launcher3/resource/K$c;->d:I

    .line 28
    .line 29
    if-eq v0, p1, :cond_0

    .line 30
    .line 31
    iput p1, p0, Lcom/android/launcher3/resource/K$c;->d:I

    .line 32
    .line 33
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Lcom/android/launcher3/resource/g0;->R2()V

    .line 38
    .line 39
    .line 40
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->p()Lcom/android/launcher3/resource/z;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    if-eqz v0, :cond_0

    .line 49
    .line 50
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->p()Lcom/android/launcher3/resource/z;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0}, Lcom/android/launcher3/resource/z;->h()Lcom/android/launcher3/resource/w;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    if-eqz v0, :cond_0

    .line 63
    .line 64
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->p()Lcom/android/launcher3/resource/z;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0}, Lcom/android/launcher3/resource/z;->h()Lcom/android/launcher3/resource/w;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iget v1, p0, Lcom/android/launcher3/resource/K$c;->d:I

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Lcom/android/launcher3/resource/w;->K(I)V

    .line 79
    .line 80
    .line 81
    :cond_0
    const/high16 v0, -0x1000000

    .line 82
    .line 83
    if-ne p1, v0, :cond_1

    .line 84
    .line 85
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    const v0, 0x7f040781

    .line 90
    .line 91
    .line 92
    const v1, 0x7f1501aa

    .line 93
    .line 94
    .line 95
    invoke-static {p1, v0, v1}, Lcom/android/launcher3/util/F2;->e(Landroid/content/Context;II)I

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    :cond_1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->e()Lcom/android/launcher3/H5$i;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    if-eqz v0, :cond_2

    .line 108
    .line 109
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->e()Lcom/android/launcher3/H5$i;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-interface {v0, p1}, Lcom/android/launcher3/H5$i;->onForeColorChanged(I)V

    .line 118
    .line 119
    .line 120
    :cond_2
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->w()Lcom/android/launcher3/H5$h;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    if-eqz v0, :cond_3

    .line 129
    .line 130
    invoke-interface {v0, p1}, Lcom/android/launcher3/H5$h;->onForeColorChanged(I)V

    .line 131
    .line 132
    .line 133
    :cond_3
    if-eqz p2, :cond_4

    .line 134
    .line 135
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    const-string p2, "MiFavor_current_forecolor"

    .line 140
    .line 141
    iget p0, p0, Lcom/android/launcher3/resource/K$c;->d:I

    .line 142
    .line 143
    invoke-virtual {p1, p2, p0}, Lcom/android/launcher3/resource/o0;->U(Ljava/lang/String;I)V

    .line 144
    .line 145
    .line 146
    :cond_4
    return-void
.end method

.method l(ZZ)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "setIsDefaultWallpaper  is default :"

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
    const-string v1, "R-Loader"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-boolean v0, p0, Lcom/android/launcher3/resource/K$c;->h:Z

    .line 24
    .line 25
    if-eq v0, p1, :cond_0

    .line 26
    .line 27
    iput-boolean p1, p0, Lcom/android/launcher3/resource/K$c;->h:Z

    .line 28
    .line 29
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Lcom/android/launcher3/resource/o0;->e()Lcom/android/launcher3/H5$i;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Lcom/android/launcher3/resource/o0;->e()Lcom/android/launcher3/H5$i;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iget-boolean v0, p0, Lcom/android/launcher3/resource/K$c;->h:Z

    .line 48
    .line 49
    invoke-interface {p1, v0}, Lcom/android/launcher3/H5$i;->b(Z)V

    .line 50
    .line 51
    .line 52
    :cond_0
    if-eqz p2, :cond_1

    .line 53
    .line 54
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    const-string p2, "MiFavor_is_current_wallpaper"

    .line 59
    .line 60
    iget-boolean p0, p0, Lcom/android/launcher3/resource/K$c;->h:Z

    .line 61
    .line 62
    invoke-virtual {p1, p2, p0}, Lcom/android/launcher3/resource/o0;->X(Ljava/lang/String;Z)V

    .line 63
    .line 64
    .line 65
    :cond_1
    return-void
.end method

.method m(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/resource/K$c;->g:Z

    .line 2
    .line 3
    return-void
.end method

.method n(IZ)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "setMainColor  mainColor :"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "R-Loader"

    .line 23
    .line 24
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    iput p1, p0, Lcom/android/launcher3/resource/K$c;->e:I

    .line 28
    .line 29
    if-eqz p2, :cond_0

    .line 30
    .line 31
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const-string p2, "MiFavor_current_maincolor"

    .line 36
    .line 37
    iget p0, p0, Lcom/android/launcher3/resource/K$c;->e:I

    .line 38
    .line 39
    invoke-virtual {p1, p2, p0}, Lcom/android/launcher3/resource/o0;->U(Ljava/lang/String;I)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method o(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/resource/K$c;->c:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string p2, "MiFavor_current_theme"

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/resource/K$c;->c:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p1, p2, p0}, Lcom/android/launcher3/resource/o0;->V(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method p(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "setSelectedWallpaper "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, " updateFlag :"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "R-Loader"

    .line 27
    .line 28
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Lcom/android/launcher3/resource/K$c;->a:Ljava/lang/String;

    .line 32
    .line 33
    if-eqz p2, :cond_0

    .line 34
    .line 35
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    const-string p2, "MiFavor_selected_wallpaper"

    .line 40
    .line 41
    iget-object v0, p0, Lcom/android/launcher3/resource/K$c;->a:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p1, p2, v0}, Lcom/android/launcher3/resource/o0;->V(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/resource/K$c;->i:Ljava/util/List;

    .line 47
    .line 48
    if-eqz p0, :cond_1

    .line 49
    .line 50
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-eqz p1, :cond_1

    .line 59
    .line 60
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    check-cast p1, Lcom/android/launcher3/resource/g0$h;

    .line 65
    .line 66
    invoke-interface {p1}, Lcom/android/launcher3/resource/g0$h;->a()V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    return-void
.end method

.method q(IZ)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "setStatusForeColor  foreColor :"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "R-Loader"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->e()Lcom/android/launcher3/H5$i;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->e()Lcom/android/launcher3/H5$i;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-interface {v0, p1}, Lcom/android/launcher3/H5$i;->k(I)V

    .line 42
    .line 43
    .line 44
    :cond_0
    iput p1, p0, Lcom/android/launcher3/resource/K$c;->f:I

    .line 45
    .line 46
    if-eqz p2, :cond_1

    .line 47
    .line 48
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    const-string p2, "MiFavor_current_statusforecolor"

    .line 53
    .line 54
    iget p0, p0, Lcom/android/launcher3/resource/K$c;->f:I

    .line 55
    .line 56
    invoke-virtual {p1, p2, p0}, Lcom/android/launcher3/resource/o0;->U(Ljava/lang/String;I)V

    .line 57
    .line 58
    .line 59
    :cond_1
    return-void
.end method
