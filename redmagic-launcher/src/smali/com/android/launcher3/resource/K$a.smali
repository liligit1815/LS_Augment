.class Lcom/android/launcher3/resource/K$a;
.super Ljava/lang/Object;
.source "MenuResource.java"

# interfaces
.implements Lcom/android/launcher3/resource/g0$h;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/resource/K;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "a"
.end annotation


# instance fields
.field a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/resource/K$d;",
            ">;"
        }
    .end annotation
.end field

.field private b:Ljava/lang/String;

.field c:Ljava/lang/Boolean;

.field private d:Ljava/lang/String;

.field e:Ljava/lang/Boolean;

.field f:Landroid/graphics/drawable/Drawable;


# direct methods
.method constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/resource/K$a;->a:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/android/launcher3/resource/K$a;->b:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/android/launcher3/resource/K$a;->c:Ljava/lang/Boolean;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/launcher3/resource/K$a;->d:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/android/launcher3/resource/K$a;->e:Ljava/lang/Boolean;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/android/launcher3/resource/K$a;->f:Landroid/graphics/drawable/Drawable;

    .line 21
    .line 22
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->t()Lcom/android/launcher3/resource/K$c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->t()Lcom/android/launcher3/resource/K$c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Lcom/android/launcher3/resource/K$c;->b()V

    .line 47
    .line 48
    .line 49
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->t()Lcom/android/launcher3/resource/K$c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0, p0}, Lcom/android/launcher3/resource/K$c;->a(Lcom/android/launcher3/resource/g0$h;)V

    .line 58
    .line 59
    .line 60
    :cond_0
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/resource/K$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/K$a;->k()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic c(Lcom/android/launcher3/resource/K$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/K$a;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Lcom/android/launcher3/resource/K$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/K$a;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic k()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->t()Lcom/android/launcher3/resource/K$c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/resource/K$c;->h()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "default_wallpaper_gallery"

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    new-instance v0, Lcom/android/launcher3/resource/K$f;

    .line 22
    .line 23
    invoke-direct {v0}, Lcom/android/launcher3/resource/K$f;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lcom/android/launcher3/resource/K$e;->F(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/resource/K$e;->o()Landroid/database/Cursor;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    const-string v1, "background"

    .line 36
    .line 37
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getBlob(I)[B

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-static {v0}, Lx1/O;->x(Landroid/database/Cursor;)V

    .line 46
    .line 47
    .line 48
    if-eqz v1, :cond_0

    .line 49
    .line 50
    invoke-static {v1}, Lx1/O;->s([B)Landroid/graphics/drawable/Drawable;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iput-object v0, p0, Lcom/android/launcher3/resource/K$a;->f:Landroid/graphics/drawable/Drawable;

    .line 55
    .line 56
    invoke-static {}, Lcom/android/launcher3/resource/K;->n()Lcom/android/launcher3/resource/K;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    if-eqz p0, :cond_0

    .line 61
    .line 62
    invoke-static {}, Lcom/android/launcher3/resource/K;->n()Lcom/android/launcher3/resource/K;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const/4 v0, 0x0

    .line 67
    invoke-virtual {p0, v0}, Lcom/android/launcher3/resource/K;->B(Z)V

    .line 68
    .line 69
    .line 70
    :cond_0
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/resource/K$a;->f:Landroid/graphics/drawable/Drawable;

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$a;->f()Landroid/graphics/drawable/Drawable;

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method e(Ljava/lang/String;)Lcom/android/launcher3/resource/K$d;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/K$a;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/android/launcher3/resource/K$d;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/android/launcher3/resource/K$d;->g()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    return-object v0

    .line 30
    :cond_1
    const/4 p0, 0x0

    .line 31
    return-object p0
.end method

.method f()Landroid/graphics/drawable/Drawable;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/K$a;->f:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1}, Lcom/android/launcher3/util/F2;->m(Landroid/content/Context;)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const v2, 0x7f04049c

    .line 18
    .line 19
    .line 20
    invoke-static {v0, v2, v1}, Lcom/android/launcher3/util/F2;->f(Landroid/content/Context;II)Landroid/graphics/drawable/Drawable;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lcom/android/launcher3/resource/K$a;->f:Landroid/graphics/drawable/Drawable;

    .line 25
    .line 26
    new-instance v0, Lcom/android/launcher3/resource/J;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Lcom/android/launcher3/resource/J;-><init>(Lcom/android/launcher3/resource/K$a;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v0}, Lcom/android/launcher3/resource/o0;->P(Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/resource/K$a;->f:Landroid/graphics/drawable/Drawable;

    .line 35
    .line 36
    return-object p0
.end method

.method g()Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-string v1, "android.intent.action.GET_CONTENT"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/resource/K$a;->d:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "android.intent.category.OPENABLE"

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    const-string p0, "image/*"

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    const-string p0, "WALLPAPER"

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    const/high16 p0, 0x10000000

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    return-object v0
.end method

.method h(Ljava/lang/String;)Landroid/content/Intent;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "com.zte.beautify"

    .line 6
    .line 7
    invoke-static {p0, v0}, Lx1/O;->h3(Landroid/content/Context;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    new-instance p0, Landroid/os/Bundle;

    .line 14
    .line 15
    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string p1, "TYPE"

    .line 19
    .line 20
    const/4 v0, 0x2

    .line 21
    invoke-virtual {p0, p1, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 22
    .line 23
    .line 24
    const-string p1, "Fragment_name"

    .line 25
    .line 26
    const-string v0, "RankFragment"

    .line 27
    .line 28
    invoke-virtual {p0, p1, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const-string p1, "Fragment_tag"

    .line 32
    .line 33
    const-string v0, "Detailsfragment"

    .line 34
    .line 35
    invoke-virtual {p0, p1, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    new-instance p1, Landroid/content/Intent;

    .line 39
    .line 40
    const-string v0, "zte.mfv.intent.action.beauty.online"

    .line 41
    .line 42
    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1, p0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 46
    .line 47
    .line 48
    const/high16 p0, 0x10000000

    .line 49
    .line 50
    invoke-virtual {p1, p0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 51
    .line 52
    .line 53
    return-object p1

    .line 54
    :cond_0
    new-instance p0, Landroid/content/Intent;

    .line 55
    .line 56
    const-string v0, "com.nqmobile.live.storeMenu"

    .line 57
    .line 58
    invoke-direct {p0, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    const-string v0, "wallpaper"

    .line 62
    .line 63
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-eqz p1, :cond_1

    .line 68
    .line 69
    const-string p1, "fragment_index_to_show"

    .line 70
    .line 71
    const/4 v0, 0x1

    .line 72
    invoke-virtual {p0, p1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 73
    .line 74
    .line 75
    :cond_1
    return-object p0
.end method

.method i()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/K$a;->e:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const-string v0, "zte.intent.action.GET_CONTENT"

    .line 11
    .line 12
    iput-object v0, p0, Lcom/android/launcher3/resource/K$a;->d:Ljava/lang/String;

    .line 13
    .line 14
    new-instance v0, Landroid/content/Intent;

    .line 15
    .line 16
    const-string v1, "android.intent.action.GET_CONTENT"

    .line 17
    .line 18
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v2, p0, Lcom/android/launcher3/resource/K$a;->d:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    const-string v2, "android.intent.category.OPENABLE"

    .line 27
    .line 28
    invoke-virtual {v0, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    const-string v2, "image/*"

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    const-string v2, "WALLPAPER"

    .line 37
    .line 38
    const/4 v3, 0x0

    .line 39
    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 40
    .line 41
    .line 42
    const/high16 v2, 0x10000000

    .line 43
    .line 44
    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 45
    .line 46
    .line 47
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-static {v2, v0}, Lx1/O;->u2(Landroid/content/Context;Landroid/content/Intent;)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    const-string v3, "R-Loader"

    .line 56
    .line 57
    if-nez v2, :cond_1

    .line 58
    .line 59
    const-string v2, "ZTE_ACTION_GET_CONTENT not exist!"

    .line 60
    .line 61
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    iput-object v1, p0, Lcom/android/launcher3/resource/K$a;->d:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 67
    .line 68
    .line 69
    :cond_1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-static {v1, v0}, Lx1/O;->u2(Landroid/content/Context;Landroid/content/Intent;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-nez v0, :cond_2

    .line 78
    .line 79
    const-string v0, "ACTION_GET_CONTENT not response!"

    .line 80
    .line 81
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    .line 83
    .line 84
    const/4 v0, 0x0

    .line 85
    iput-object v0, p0, Lcom/android/launcher3/resource/K$a;->d:Ljava/lang/String;

    .line 86
    .line 87
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/resource/K$a;->d:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    xor-int/lit8 v0, v0, 0x1

    .line 94
    .line 95
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    iput-object v0, p0, Lcom/android/launcher3/resource/K$a;->e:Ljava/lang/Boolean;

    .line 100
    .line 101
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 102
    .line 103
    .line 104
    move-result p0

    .line 105
    return p0
.end method

.method j()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/K$a;->c:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/resource/K$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/resource/K$a;->c:Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_0
    invoke-static {}, Lx1/O;->q0()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    const-string v0, "ro.vendor.mifavor.theme.online"

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const-string v0, "ro.mifavor.theme.online"

    .line 30
    .line 31
    :goto_0
    const/4 v1, 0x0

    .line 32
    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    const-string v2, "com.nqmobile.livestore.ztemf32"

    .line 41
    .line 42
    invoke-static {v1, v2}, Lx1/O;->h3(Landroid/content/Context;Ljava/lang/String;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    const/4 v3, 0x1

    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    iput-object v2, p0, Lcom/android/launcher3/resource/K$a;->b:Ljava/lang/String;

    .line 50
    .line 51
    move v0, v3

    .line 52
    :cond_2
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    const-string v2, "com.zte.beautify"

    .line 57
    .line 58
    invoke-static {v1, v2}, Lx1/O;->h3(Landroid/content/Context;Ljava/lang/String;)Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-eqz v1, :cond_3

    .line 63
    .line 64
    iput-object v2, p0, Lcom/android/launcher3/resource/K$a;->b:Ljava/lang/String;

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_3
    move v3, v0

    .line 68
    :goto_1
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iput-object v0, p0, Lcom/android/launcher3/resource/K$a;->c:Ljava/lang/Boolean;

    .line 73
    .line 74
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    return p0
.end method
