.class public Lcom/android/launcher3/MFVDockExpandSupport;
.super Ljava/lang/Object;
.source "MFVDockExpandSupport.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/MFVDockExpandSupport$f;,
        Lcom/android/launcher3/MFVDockExpandSupport$CallShardStateData;
    }
.end annotation


# static fields
.field public static j:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/I;",
            ">;"
        }
    .end annotation
.end field

.field private static k:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/I;",
            ">;"
        }
    .end annotation
.end field

.field private static l:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/I;",
            ">;"
        }
    .end annotation
.end field

.field private static m:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/I;",
            ">;"
        }
    .end annotation
.end field

.field private static n:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/I;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field a:Landroid/content/Context;

.field private b:Lcom/android/launcher3/MFVDockExpandSupport$f;

.field private c:Z

.field private d:Lcom/android/launcher3/f;

.field public final e:Landroid/content/BroadcastReceiver;

.field f:Landroid/database/ContentObserver;

.field g:Landroid/database/ContentObserver;

.field private h:Landroid/database/ContentObserver;

.field private i:Ljava/lang/Boolean;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/MFVDockExpandSupport;->j:Ljava/util/ArrayList;

    .line 7
    .line 8
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/android/launcher3/MFVDockExpandSupport;->k:Ljava/util/ArrayList;

    .line 14
    .line 15
    new-instance v0, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/android/launcher3/MFVDockExpandSupport;->l:Ljava/util/ArrayList;

    .line 21
    .line 22
    new-instance v0, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    sput-object v0, Lcom/android/launcher3/MFVDockExpandSupport;->m:Ljava/util/ArrayList;

    .line 28
    .line 29
    new-instance v0, Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 32
    .line 33
    .line 34
    sput-object v0, Lcom/android/launcher3/MFVDockExpandSupport;->n:Ljava/util/ArrayList;

    .line 35
    .line 36
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/MFVDockExpandSupport;->c:Z

    .line 6
    .line 7
    new-instance v0, Lcom/android/launcher3/MFVDockExpandSupport$b;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Lcom/android/launcher3/MFVDockExpandSupport$b;-><init>(Lcom/android/launcher3/MFVDockExpandSupport;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/android/launcher3/MFVDockExpandSupport;->e:Landroid/content/BroadcastReceiver;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Lcom/android/launcher3/MFVDockExpandSupport;->i:Ljava/lang/Boolean;

    .line 16
    .line 17
    iput-object p1, p0, Lcom/android/launcher3/MFVDockExpandSupport;->a:Landroid/content/Context;

    .line 18
    .line 19
    return-void
.end method

.method private D(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/I;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lcom/android/launcher3/model/data/I;

    .line 23
    .line 24
    invoke-static {p1}, Lx1/O;->x4(Lcom/android/launcher3/model/data/I;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    :goto_1
    return-void
.end method

.method private R(Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/I;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Lcom/android/launcher3/model/data/I;

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    iget-object v2, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 52
    .line 53
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/D3;->Z(Ljava/lang/String;Landroid/os/UserHandle;)Lcom/android/launcher3/model/data/d;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    if-eqz v0, :cond_0

    .line 58
    .line 59
    iget-object v0, v0, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 60
    .line 61
    iput-object v0, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/MFVDockExpandSupport;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/MFVDockExpandSupport;->v(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/MFVDockExpandSupport;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/MFVDockExpandSupport;->w(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic c(Lcom/android/launcher3/MFVDockExpandSupport;)Lcom/android/launcher3/MFVDockExpandSupport$f;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/MFVDockExpandSupport;->b:Lcom/android/launcher3/MFVDockExpandSupport$f;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Lcom/android/launcher3/MFVDockExpandSupport;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/MFVDockExpandSupport;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic e(Lcom/android/launcher3/MFVDockExpandSupport;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/MFVDockExpandSupport;->c:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic f(Lcom/android/launcher3/MFVDockExpandSupport;)Lcom/android/launcher3/model/data/I;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/MFVDockExpandSupport;->m()Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic g(Lcom/android/launcher3/MFVDockExpandSupport;[B)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/MFVDockExpandSupport;->u([B)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic h()Ljava/util/ArrayList;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/MFVDockExpandSupport;->n:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object v0
.end method

.method static bridge synthetic i()Ljava/util/ArrayList;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/MFVDockExpandSupport;->l:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object v0
.end method

.method static l(Landroid/graphics/Bitmap;ZLandroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    const-string v1, "MFVDockExpandSupport"

    .line 3
    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    const-string p0, "createCornerMarkBitmap originalIcon is null !!"

    .line 7
    .line 8
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    invoke-static {p2}, Lx1/O;->G(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    if-nez p2, :cond_1

    .line 17
    .line 18
    const-string p0, "createCornerMarkBitmap cornerMarkIcon is null !!"

    .line 19
    .line 20
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    return-object v0

    .line 24
    :cond_1
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    new-instance v4, Landroid/graphics/Canvas;

    .line 41
    .line 42
    invoke-direct {v4}, Landroid/graphics/Canvas;-><init>()V

    .line 43
    .line 44
    .line 45
    new-instance v5, Landroid/graphics/Paint;

    .line 46
    .line 47
    invoke-direct {v5}, Landroid/graphics/Paint;-><init>()V

    .line 48
    .line 49
    .line 50
    const/4 v6, 0x1

    .line 51
    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v4, p0}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v4}, Landroid/graphics/Canvas;->save()I

    .line 58
    .line 59
    .line 60
    if-nez p1, :cond_2

    .line 61
    .line 62
    sub-int/2addr v0, v2

    .line 63
    sub-int/2addr v1, v3

    .line 64
    goto :goto_0

    .line 65
    :cond_2
    const/4 v0, 0x0

    .line 66
    move v1, v0

    .line 67
    :goto_0
    int-to-float p1, v0

    .line 68
    int-to-float v0, v1

    .line 69
    invoke-virtual {v4, p2, p1, v0, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v4}, Landroid/graphics/Canvas;->restore()V

    .line 73
    .line 74
    .line 75
    return-object p0
.end method

.method private m()Lcom/android/launcher3/model/data/I;
    .locals 5

    .line 1
    new-instance v0, Landroid/content/ComponentName;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    const-string v2, "call_share_tag"

    .line 6
    .line 7
    invoke-direct {v0, v2, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Landroid/content/Intent;

    .line 11
    .line 12
    const-string v3, "android.intent.action.MAIN"

    .line 13
    .line 14
    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object v3, p0, Lcom/android/launcher3/MFVDockExpandSupport;->a:Landroid/content/Context;

    .line 18
    .line 19
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-static {}, Lx1/S;->r()Z

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    if-eqz v4, :cond_0

    .line 28
    .line 29
    const v4, 0x7f080f45

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const v4, 0x7f080f44

    .line 34
    .line 35
    .line 36
    :goto_0
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-direct {p0, v0, v1, v3, v2}, Lcom/android/launcher3/MFVDockExpandSupport;->x(Landroid/content/ComponentName;Landroid/content/Intent;Landroid/graphics/drawable/Drawable;Ljava/lang/String;)Lcom/android/launcher3/model/data/I;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object v1, v0, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 45
    .line 46
    iget-object v1, v1, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 47
    .line 48
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 49
    .line 50
    const/4 v3, 0x1

    .line 51
    invoke-virtual {v1, v2, v3}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    iget-object p0, p0, Lcom/android/launcher3/MFVDockExpandSupport;->a:Landroid/content/Context;

    .line 56
    .line 57
    const v2, 0x7f080dae

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    const/4 v2, 0x0

    .line 65
    invoke-static {v1, v2, p0}, Lcom/android/launcher3/MFVDockExpandSupport;->l(Landroid/graphics/Bitmap;ZLandroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    iget-object v1, v0, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 70
    .line 71
    iget-object v1, v1, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 72
    .line 73
    new-instance v2, Ls1/d;

    .line 74
    .line 75
    iget-object v3, v0, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 76
    .line 77
    iget v3, v3, Ls1/d;->b:I

    .line 78
    .line 79
    invoke-direct {v2, p0, v3}, Ls1/d;-><init>(Landroid/graphics/Bitmap;I)V

    .line 80
    .line 81
    .line 82
    iput-object v2, v0, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 83
    .line 84
    invoke-static {v1}, Lx1/O;->w4(Landroid/graphics/Bitmap;)V

    .line 85
    .line 86
    .line 87
    return-object v0
.end method

.method public static t()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/I;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/android/launcher3/MFVDockExpandSupport;->k:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object v0
.end method

.method private u([B)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    aget-byte p0, p1, p0

    .line 3
    .line 4
    const/16 v0, 0x52

    .line 5
    .line 6
    if-ne v0, p0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    aget-byte p0, p1, p0

    .line 10
    .line 11
    const/16 v0, 0x49

    .line 12
    .line 13
    if-ne v0, p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x2

    .line 16
    aget-byte p0, p1, p0

    .line 17
    .line 18
    const/16 v0, 0x46

    .line 19
    .line 20
    if-ne v0, p0, :cond_0

    .line 21
    .line 22
    const/4 p0, 0x3

    .line 23
    aget-byte p0, p1, p0

    .line 24
    .line 25
    if-ne v0, p0, :cond_0

    .line 26
    .line 27
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 31
    .line 32
    return-object p0
.end method

.method private synthetic v(Z)V
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/android/launcher3/MFVDockExpandSupport;->i:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/MFVDockExpandSupport;->p()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic w(Landroid/content/Context;)V
    .locals 4

    .line 1
    const-string v0, "MFVDockExpandSupport"

    .line 2
    .line 3
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/MFVDockExpandSupport;->B(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 7
    :try_start_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v2, "Multi-screen: switchState "

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 25
    .line 26
    .line 27
    goto :goto_1

    .line 28
    :catch_0
    move-exception v1

    .line 29
    goto :goto_0

    .line 30
    :catch_1
    move-exception v1

    .line 31
    const/4 p1, 0x0

    .line 32
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 35
    .line 36
    .line 37
    const-string v3, "Multi-screen: switchState e:"

    .line 38
    .line 39
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    :goto_1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 53
    .line 54
    new-instance v1, Lcom/android/launcher3/Z3;

    .line 55
    .line 56
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/Z3;-><init>(Lcom/android/launcher3/MFVDockExpandSupport;Z)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method private x(Landroid/content/ComponentName;Landroid/content/Intent;Landroid/graphics/drawable/Drawable;Ljava/lang/String;)Lcom/android/launcher3/model/data/I;
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/model/data/d;

    .line 2
    .line 3
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, p1, p4, v1, p2}, Lcom/android/launcher3/model/data/d;-><init>(Landroid/content/ComponentName;Ljava/lang/CharSequence;Landroid/os/UserHandle;Landroid/content/Intent;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/launcher3/MFVDockExpandSupport;->a:Landroid/content/Context;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Lcom/android/launcher3/model/data/d;->a(Landroid/content/Context;)Lcom/android/launcher3/model/data/I;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object p0, p0, Lcom/android/launcher3/MFVDockExpandSupport;->a:Landroid/content/Context;

    .line 17
    .line 18
    invoke-static {p0}, Ls1/X;->m0(Landroid/content/Context;)Ls1/X;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0, p3}, Ls1/b;->d(Landroid/graphics/drawable/Drawable;)Ls1/d;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    iput-object p2, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 27
    .line 28
    invoke-virtual {p0}, Ls1/X;->close()V

    .line 29
    .line 30
    .line 31
    new-instance p0, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 34
    .line 35
    .line 36
    const-string p2, "Multi-screen: makeWorkSpaceItemInfo workspaceItemInfo="

    .line 37
    .line 38
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    const-string p2, "MFVDockExpandSupport"

    .line 49
    .line 50
    invoke-static {p2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    return-object p1
.end method


# virtual methods
.method public A(Ljava/lang/String;Landroid/os/UserHandle;)V
    .locals 2

    .line 1
    invoke-static {}, Lx1/O;->C3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Lcom/android/launcher3/MFVDockExpandSupport;->k:Ljava/util/ArrayList;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-static {v0, p1, v1, p2}, Lx1/O;->w1(Ljava/util/ArrayList;Ljava/lang/String;ZLandroid/os/UserHandle;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Lcom/android/launcher3/MFVDockExpandSupport;->y(Z)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public B(Landroid/content/Context;)Z
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    const-string v0, "content://com.zte.multscr.ZCastProvider"

    .line 7
    .line 8
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p1, v0}, Landroid/content/ContentResolver;->acquireUnstableContentProviderClient(Landroid/net/Uri;)Landroid/content/ContentProviderClient;

    .line 13
    .line 14
    .line 15
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    :try_start_1
    const-string v0, "getCallShare"

    .line 17
    .line 18
    invoke-virtual {p1, v0, p0, p0}, Landroid/content/ContentProviderClient;->call(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 19
    .line 20
    .line 21
    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    :try_start_2
    invoke-virtual {p1}, Landroid/content/ContentProviderClient;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 23
    .line 24
    .line 25
    goto :goto_2

    .line 26
    :catch_0
    move-exception p1

    .line 27
    goto :goto_1

    .line 28
    :catchall_0
    move-exception v0

    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    :try_start_3
    invoke-virtual {p1}, Landroid/content/ContentProviderClient;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catchall_1
    move-exception p1

    .line 36
    :try_start_4
    invoke-virtual {v0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    :goto_0
    throw v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 40
    :goto_1
    const-string v0, "MFVDockExpandSupport"

    .line 41
    .line 42
    const-string v1, "Multi-screen: queryCallShareSwitchState acquireUnstableContentProviderClient error::"

    .line 43
    .line 44
    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 45
    .line 46
    .line 47
    :goto_2
    const/4 p1, 0x0

    .line 48
    if-eqz p0, :cond_1

    .line 49
    .line 50
    const-string v0, "call_share_enabled"

    .line 51
    .line 52
    invoke-virtual {p0, v0, p1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-eqz p0, :cond_1

    .line 57
    .line 58
    const/4 p1, 0x1

    .line 59
    :cond_1
    return p1
.end method

.method public C(Landroid/content/Context;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/Y3;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/Y3;-><init>(Lcom/android/launcher3/MFVDockExpandSupport;Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public E(Lcom/android/launcher3/C2;Lcom/zte/activityevent/ActivityEventsManager;)V
    .locals 1

    .line 1
    const-string p2, "MFVDockExpandSupport"

    .line 2
    .line 3
    const-string v0, "recentApp: register AppActivityEventCallback!"

    .line 4
    .line 5
    invoke-static {p2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    new-instance p2, Lcom/android/launcher3/f;

    .line 9
    .line 10
    invoke-direct {p2, p1}, Lcom/android/launcher3/f;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    iput-object p2, p0, Lcom/android/launcher3/MFVDockExpandSupport;->d:Lcom/android/launcher3/f;

    .line 14
    .line 15
    new-instance p1, Lcom/android/launcher3/MFVDockExpandSupport$f;

    .line 16
    .line 17
    invoke-direct {p1, p0}, Lcom/android/launcher3/MFVDockExpandSupport$f;-><init>(Lcom/android/launcher3/MFVDockExpandSupport;)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lcom/android/launcher3/MFVDockExpandSupport;->b:Lcom/android/launcher3/MFVDockExpandSupport$f;

    .line 21
    .line 22
    sget-object p1, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 23
    .line 24
    iget-object p2, p0, Lcom/android/launcher3/MFVDockExpandSupport;->a:Landroid/content/Context;

    .line 25
    .line 26
    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Lcom/android/launcher3/anim/C;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/android/launcher3/MFVDockExpandSupport;->b:Lcom/android/launcher3/MFVDockExpandSupport$f;

    .line 33
    .line 34
    invoke-virtual {p1, p0}, Lcom/android/launcher3/anim/C;->g(Lcom/android/launcher3/anim/C$d;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public F(Landroid/content/Context;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/MFVDockExpandSupport$d;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, p0, v1, p1}, Lcom/android/launcher3/MFVDockExpandSupport$d;-><init>(Lcom/android/launcher3/MFVDockExpandSupport;Landroid/os/Handler;Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/android/launcher3/MFVDockExpandSupport;->g:Landroid/database/ContentObserver;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string v0, "app_switch_on"

    .line 19
    .line 20
    invoke-static {v0}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/4 v1, 0x0

    .line 25
    iget-object p0, p0, Lcom/android/launcher3/MFVDockExpandSupport;->g:Landroid/database/ContentObserver;

    .line 26
    .line 27
    invoke-virtual {p1, v0, v1, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public G(Landroid/content/Context;)V
    .locals 4

    .line 1
    new-instance v0, Lcom/android/launcher3/MFVDockExpandSupport$e;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, p0, v1, p1}, Lcom/android/launcher3/MFVDockExpandSupport$e;-><init>(Lcom/android/launcher3/MFVDockExpandSupport;Landroid/os/Handler;Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/android/launcher3/MFVDockExpandSupport;->h:Landroid/database/ContentObserver;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "content://com.zte.multscr.ZCastProvider/call_share"

    .line 19
    .line 20
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const/4 v2, 0x0

    .line 25
    iget-object v3, p0, Lcom/android/launcher3/MFVDockExpandSupport;->h:Landroid/database/ContentObserver;

    .line 26
    .line 27
    invoke-virtual {v0, v1, v2, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/android/launcher3/MFVDockExpandSupport;->i:Ljava/lang/Boolean;

    .line 31
    .line 32
    if-nez v0, :cond_0

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lcom/android/launcher3/MFVDockExpandSupport;->C(Landroid/content/Context;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public H(Landroid/content/Context;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/MFVDockExpandSupport$c;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, p0, v1, p1}, Lcom/android/launcher3/MFVDockExpandSupport$c;-><init>(Lcom/android/launcher3/MFVDockExpandSupport;Landroid/os/Handler;Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/android/launcher3/MFVDockExpandSupport;->f:Landroid/database/ContentObserver;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string v0, "service_manager_switch"

    .line 19
    .line 20
    invoke-static {v0}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/4 v1, 0x0

    .line 25
    iget-object p0, p0, Lcom/android/launcher3/MFVDockExpandSupport;->f:Landroid/database/ContentObserver;

    .line 26
    .line 27
    invoke-virtual {p1, v0, v1, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public I(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/MFVDockExpandSupport;->c:Z

    .line 2
    .line 3
    return-void
.end method

.method public J(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "Multi-screen: startMultiScr extraFrom="

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
    const-string v1, ", pkgName="

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "MFVDockExpandSupport"

    .line 27
    .line 28
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    new-instance v0, Landroid/content/Intent;

    .line 32
    .line 33
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 34
    .line 35
    .line 36
    const-string v1, "com.zte.multscr.ACTION_START_CAST"

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 39
    .line 40
    .line 41
    const-string v1, "cast_type"

    .line 42
    .line 43
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 44
    .line 45
    .line 46
    const-string p1, "com.zte.multscr.intent.extra.CAST_APP"

    .line 47
    .line 48
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 49
    .line 50
    .line 51
    const-string p1, "com.zte.multscr"

    .line 52
    .line 53
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lcom/android/launcher3/MFVDockExpandSupport;->a:Landroid/content/Context;

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public K(Lcom/android/launcher3/model/data/y;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "com.zte.multscr"

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const-string p1, "mirror"

    .line 14
    .line 15
    const-string v0, ""

    .line 16
    .line 17
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/MFVDockExpandSupport;->J(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_0
    const-string v0, "virtual_display_tag"

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 36
    .line 37
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const-string v0, "virtualDisplay"

    .line 42
    .line 43
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/MFVDockExpandSupport;->J(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 47
    .line 48
    return-object p0

    .line 49
    :cond_1
    const-string v0, "call_share_tag"

    .line 50
    .line 51
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 62
    .line 63
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    const-string v0, "call_share"

    .line 68
    .line 69
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/MFVDockExpandSupport;->J(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 73
    .line 74
    return-object p0

    .line 75
    :cond_2
    const/4 p0, 0x0

    .line 76
    return-object p0
.end method

.method public L(Lcom/zte/activityevent/ActivityEventsManager;)V
    .locals 1

    .line 1
    const-string p1, "MFVDockExpandSupport"

    .line 2
    .line 3
    const-string v0, "recentApp: unregister AppActivityEventCallback!"

    .line 4
    .line 5
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    sget-object p1, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/MFVDockExpandSupport;->a:Landroid/content/Context;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lcom/android/launcher3/anim/C;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/launcher3/MFVDockExpandSupport;->b:Lcom/android/launcher3/MFVDockExpandSupport$f;

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Lcom/android/launcher3/anim/C;->l0(Lcom/android/launcher3/anim/C$d;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public M(Landroid/content/Context;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/MFVDockExpandSupport;->g:Landroid/database/ContentObserver;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Lcom/android/launcher3/MFVDockExpandSupport;->g:Landroid/database/ContentObserver;

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput-object p1, p0, Lcom/android/launcher3/MFVDockExpandSupport;->g:Landroid/database/ContentObserver;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public N(Landroid/content/Context;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/MFVDockExpandSupport;->h:Landroid/database/ContentObserver;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Lcom/android/launcher3/MFVDockExpandSupport;->h:Landroid/database/ContentObserver;

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput-object p1, p0, Lcom/android/launcher3/MFVDockExpandSupport;->h:Landroid/database/ContentObserver;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public O(Landroid/content/Context;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/MFVDockExpandSupport;->f:Landroid/database/ContentObserver;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Lcom/android/launcher3/MFVDockExpandSupport;->f:Landroid/database/ContentObserver;

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput-object p1, p0, Lcom/android/launcher3/MFVDockExpandSupport;->f:Landroid/database/ContentObserver;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public P(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->p()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_3

    .line 10
    .line 11
    sget-object v0, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/MFVDockExpandSupport;->a:Landroid/content/Context;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, LD1/t;

    .line 20
    .line 21
    invoke-virtual {p0}, LD1/t;->p()Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Landroid/os/UserHandle;

    .line 40
    .line 41
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v2, v0}, Lcom/zte/mifavor/launcher/adapter/compat/c;->f(Landroid/os/UserHandle;)I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-ne v1, v2, :cond_0

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    const/4 v0, 0x0

    .line 57
    :goto_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-nez p0, :cond_3

    .line 62
    .line 63
    if-eqz v0, :cond_3

    .line 64
    .line 65
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    if-eqz p0, :cond_3

    .line 70
    .line 71
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    if-nez p0, :cond_2

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_2
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {p0, p2, v0}, Lcom/android/launcher3/D3;->Z(Ljava/lang/String;Landroid/os/UserHandle;)Lcom/android/launcher3/model/data/d;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    if-eqz p0, :cond_3

    .line 95
    .line 96
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-static {p2, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-eqz p1, :cond_3

    .line 105
    .line 106
    iget-object p1, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 107
    .line 108
    if-ne p1, v0, :cond_3

    .line 109
    .line 110
    new-instance p1, Lcom/android/launcher3/util/E;

    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/d;->getTargetComponent()Landroid/content/ComponentName;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-direct {p1, p0, v0}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 117
    .line 118
    .line 119
    new-instance p0, Ljava/lang/StringBuilder;

    .line 120
    .line 121
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 122
    .line 123
    .line 124
    const-string v1, "updateComponentFrequencyNotClickFromLauncher: pkgName="

    .line 125
    .line 126
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    const-string p2, ", user="

    .line 133
    .line 134
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    const-string p2, "MFVDockExpandSupport"

    .line 145
    .line 146
    invoke-static {p2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    .line 148
    .line 149
    invoke-static {}, Lcom/android/launcher3/resource/g;->l()Lcom/android/launcher3/resource/g;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/g;->t(Lcom/android/launcher3/util/E;)V

    .line 154
    .line 155
    .line 156
    :cond_3
    :goto_1
    return-void
.end method

.method public Q()V
    .locals 2

    .line 1
    const-string v0, "MFVDockExpandSupport"

    .line 2
    .line 3
    const-string v1, "recentApp: updateHotseatRecentIcon"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/android/launcher3/MFVDockExpandSupport;->t()Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-direct {p0, v0}, Lcom/android/launcher3/MFVDockExpandSupport;->R(Ljava/util/ArrayList;)V

    .line 13
    .line 14
    .line 15
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 16
    .line 17
    new-instance v1, Lcom/android/launcher3/MFVDockExpandSupport$a;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Lcom/android/launcher3/MFVDockExpandSupport$a;-><init>(Lcom/android/launcher3/MFVDockExpandSupport;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public j()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/MFVDockExpandSupport;->b:Lcom/android/launcher3/MFVDockExpandSupport$f;

    .line 3
    .line 4
    return-void
.end method

.method public k()V
    .locals 3

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-virtual {p0, v2, v0, v1}, Lcom/android/launcher3/MFVDockExpandSupport;->o(ZLjava/lang/String;Landroid/graphics/Bitmap;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public n(Ljava/lang/String;Landroid/os/UserHandle;)Z
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "recentApp: generateDataByPkgName pkgName="

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
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "MFVDockExpandSupport"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const/4 v2, 0x0

    .line 28
    if-nez v0, :cond_6

    .line 29
    .line 30
    const-string v0, "com.zte.multscr"

    .line 31
    .line 32
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_6

    .line 37
    .line 38
    if-eqz p2, :cond_6

    .line 39
    .line 40
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    if-eqz v0, :cond_6

    .line 45
    .line 46
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    if-eqz v0, :cond_6

    .line 55
    .line 56
    const-string v0, "com.android.contacts"

    .line 57
    .line 58
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_0

    .line 63
    .line 64
    goto/16 :goto_1

    .line 65
    .line 66
    :cond_0
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {v0, p1, p2}, Lcom/android/launcher3/D3;->Z(Ljava/lang/String;Landroid/os/UserHandle;)Lcom/android/launcher3/model/data/d;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    if-nez p1, :cond_1

    .line 79
    .line 80
    const-string p0, "recentApp: generateDataByPkgName app return false, because the appinfo is in null!"

    .line 81
    .line 82
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    .line 84
    .line 85
    return v2

    .line 86
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 89
    .line 90
    .line 91
    const-string v3, "recentApp: appinfo="

    .line 92
    .line 93
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lcom/android/launcher3/MFVDockExpandSupport;->d:Lcom/android/launcher3/f;

    .line 107
    .line 108
    const-string v3, "recentApp: generateDataByPkgName app return false, because the "

    .line 109
    .line 110
    if-eqz v0, :cond_2

    .line 111
    .line 112
    iget-object v4, p0, Lcom/android/launcher3/MFVDockExpandSupport;->a:Landroid/content/Context;

    .line 113
    .line 114
    invoke-static {v4}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 115
    .line 116
    .line 117
    move-result-object v4

    .line 118
    iget-object v5, p1, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 119
    .line 120
    invoke-virtual {v0, v4, v5, p2}, Lcom/android/launcher3/f;->b(Lcom/android/launcher3/P2;Landroid/content/ComponentName;Landroid/os/UserHandle;)Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    if-eqz v0, :cond_2

    .line 125
    .line 126
    new-instance p0, Ljava/lang/StringBuilder;

    .line 127
    .line 128
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 135
    .line 136
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    const-string p1, " is in hide folder!"

    .line 140
    .line 141
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    .line 150
    .line 151
    return v2

    .line 152
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/MFVDockExpandSupport;->a:Landroid/content/Context;

    .line 153
    .line 154
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    iget-object v4, p0, Lcom/android/launcher3/MFVDockExpandSupport;->a:Landroid/content/Context;

    .line 163
    .line 164
    invoke-static {v4}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 165
    .line 166
    .line 167
    move-result-object v4

    .line 168
    iget-object v5, p1, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 169
    .line 170
    invoke-virtual {v0, v4, v5, p2}, Lcom/android/launcher3/H5;->z0(Lcom/android/launcher3/P2;Landroid/content/ComponentName;Landroid/os/UserHandle;)Z

    .line 171
    .line 172
    .line 173
    move-result v0

    .line 174
    if-eqz v0, :cond_3

    .line 175
    .line 176
    new-instance p0, Ljava/lang/StringBuilder;

    .line 177
    .line 178
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 179
    .line 180
    .line 181
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 185
    .line 186
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    const-string p1, " is hide!"

    .line 190
    .line 191
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object p0

    .line 198
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 199
    .line 200
    .line 201
    return v2

    .line 202
    :cond_3
    iget-object v0, p1, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 203
    .line 204
    if-eqz v0, :cond_6

    .line 205
    .line 206
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    invoke-virtual {v0}, Lcom/android/launcher3/Hotseat;->getAppList()Ljava/util/ArrayList;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    iget-object v3, p1, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 219
    .line 220
    invoke-static {v0, v3, v2, v2, p2}, Lx1/O;->v1(Ljava/util/ArrayList;Landroid/content/ComponentName;ZZLandroid/os/UserHandle;)Z

    .line 221
    .line 222
    .line 223
    move-result v0

    .line 224
    if-nez v0, :cond_6

    .line 225
    .line 226
    sget-object v0, Lcom/android/launcher3/MFVDockExpandSupport;->k:Ljava/util/ArrayList;

    .line 227
    .line 228
    iget-object v3, p1, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 229
    .line 230
    const/4 v4, 0x1

    .line 231
    invoke-static {v0, v3, v4, v2, p2}, Lx1/O;->v1(Ljava/util/ArrayList;Landroid/content/ComponentName;ZZLandroid/os/UserHandle;)Z

    .line 232
    .line 233
    .line 234
    move-result p2

    .line 235
    if-eqz p2, :cond_4

    .line 236
    .line 237
    new-instance p2, Ljava/lang/StringBuilder;

    .line 238
    .line 239
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 240
    .line 241
    .line 242
    const-string v0, "recentApp: sRecentOpenAppList.size="

    .line 243
    .line 244
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    sget-object v0, Lcom/android/launcher3/MFVDockExpandSupport;->k:Ljava/util/ArrayList;

    .line 248
    .line 249
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 250
    .line 251
    .line 252
    move-result v0

    .line 253
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 254
    .line 255
    .line 256
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 257
    .line 258
    .line 259
    move-result-object p2

    .line 260
    invoke-static {v1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 261
    .line 262
    .line 263
    :cond_4
    iget-object p0, p0, Lcom/android/launcher3/MFVDockExpandSupport;->a:Landroid/content/Context;

    .line 264
    .line 265
    invoke-virtual {p1, p0}, Lcom/android/launcher3/model/data/d;->a(Landroid/content/Context;)Lcom/android/launcher3/model/data/I;

    .line 266
    .line 267
    .line 268
    move-result-object p0

    .line 269
    const/16 p1, -0x82

    .line 270
    .line 271
    iput p1, p0, Lcom/android/launcher3/model/data/y;->container:I

    .line 272
    .line 273
    sget-object p1, Lcom/android/launcher3/MFVDockExpandSupport;->k:Ljava/util/ArrayList;

    .line 274
    .line 275
    invoke-virtual {p1, v2, p0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 276
    .line 277
    .line 278
    sget-object p0, Lcom/android/launcher3/MFVDockExpandSupport;->k:Ljava/util/ArrayList;

    .line 279
    .line 280
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 281
    .line 282
    .line 283
    move-result p0

    .line 284
    const/4 p1, 0x3

    .line 285
    if-le p0, p1, :cond_5

    .line 286
    .line 287
    sget-object p0, Lcom/android/launcher3/MFVDockExpandSupport;->k:Ljava/util/ArrayList;

    .line 288
    .line 289
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 290
    .line 291
    .line 292
    move-result p0

    .line 293
    sub-int/2addr p0, v4

    .line 294
    :goto_0
    if-lt p0, p1, :cond_5

    .line 295
    .line 296
    sget-object p2, Lcom/android/launcher3/MFVDockExpandSupport;->k:Ljava/util/ArrayList;

    .line 297
    .line 298
    invoke-virtual {p2, p0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 299
    .line 300
    .line 301
    add-int/lit8 p0, p0, -0x1

    .line 302
    .line 303
    goto :goto_0

    .line 304
    :cond_5
    return v4

    .line 305
    :cond_6
    :goto_1
    return v2
.end method

.method public o(ZLjava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "Multi-screen: generateMultiScrAppDataList shouldAdd="

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
    const-string v1, ", bitmap="

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "MFVDockExpandSupport"

    .line 27
    .line 28
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    new-instance v0, Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 34
    .line 35
    .line 36
    const/4 v2, 0x1

    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    if-eqz p3, :cond_1

    .line 40
    .line 41
    new-instance p1, Landroid/content/ComponentName;

    .line 42
    .line 43
    const-string v3, "virtual_display_tag"

    .line 44
    .line 45
    const-string v4, ""

    .line 46
    .line 47
    invoke-direct {p1, v3, v4}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    sget-object v3, Lcom/android/launcher3/MFVDockExpandSupport;->m:Ljava/util/ArrayList;

    .line 51
    .line 52
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    invoke-static {v3, p1, v2, v2, v4}, Lx1/O;->v1(Ljava/util/ArrayList;Landroid/content/ComponentName;ZZLandroid/os/UserHandle;)Z

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    if-eqz v3, :cond_0

    .line 61
    .line 62
    new-instance v3, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 65
    .line 66
    .line 67
    const-string v4, "Multi-screen: isContainsInWorkspaceItemInfoList mMultiScrAppDataList.size="

    .line 68
    .line 69
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    sget-object v4, Lcom/android/launcher3/MFVDockExpandSupport;->m:Ljava/util/ArrayList;

    .line 73
    .line 74
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    :cond_0
    new-instance v3, Landroid/content/Intent;

    .line 89
    .line 90
    const-string v4, "android.intent.action.MAIN"

    .line 91
    .line 92
    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    new-instance v4, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 98
    .line 99
    .line 100
    const-string v5, "Multi-screen: generateMultiScrAppDataList pkgName="

    .line 101
    .line 102
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v4

    .line 112
    invoke-static {v1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    .line 114
    .line 115
    iget-object v1, p0, Lcom/android/launcher3/MFVDockExpandSupport;->a:Landroid/content/Context;

    .line 116
    .line 117
    invoke-static {v1, p3}, Lx1/O;->o(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-direct {p0, p1, v3, v1, p2}, Lcom/android/launcher3/MFVDockExpandSupport;->x(Landroid/content/ComponentName;Landroid/content/Intent;Landroid/graphics/drawable/Drawable;Ljava/lang/String;)Lcom/android/launcher3/model/data/I;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    iget-object p2, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 126
    .line 127
    iget-object p2, p2, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 128
    .line 129
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 130
    .line 131
    invoke-virtual {p2, v1, v2}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    .line 132
    .line 133
    .line 134
    move-result-object p2

    .line 135
    iget-object v1, p0, Lcom/android/launcher3/MFVDockExpandSupport;->a:Landroid/content/Context;

    .line 136
    .line 137
    const v3, 0x7f080dae

    .line 138
    .line 139
    .line 140
    invoke-virtual {v1, v3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    const/4 v3, 0x0

    .line 145
    invoke-static {p2, v3, v1}, Lcom/android/launcher3/MFVDockExpandSupport;->l(Landroid/graphics/Bitmap;ZLandroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    .line 146
    .line 147
    .line 148
    move-result-object p2

    .line 149
    iget-object v1, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 150
    .line 151
    iget-object v1, v1, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 152
    .line 153
    new-instance v4, Ls1/d;

    .line 154
    .line 155
    iget-object v5, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 156
    .line 157
    iget v5, v5, Ls1/d;->b:I

    .line 158
    .line 159
    invoke-direct {v4, p2, v5}, Ls1/d;-><init>(Landroid/graphics/Bitmap;I)V

    .line 160
    .line 161
    .line 162
    iput-object v4, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 163
    .line 164
    invoke-static {v1}, Lx1/O;->w4(Landroid/graphics/Bitmap;)V

    .line 165
    .line 166
    .line 167
    invoke-static {p3}, Lx1/O;->w4(Landroid/graphics/Bitmap;)V

    .line 168
    .line 169
    .line 170
    sget-object p2, Lcom/android/launcher3/MFVDockExpandSupport;->m:Ljava/util/ArrayList;

    .line 171
    .line 172
    invoke-virtual {p2, v3, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 173
    .line 174
    .line 175
    goto :goto_0

    .line 176
    :cond_1
    sget-object p1, Lcom/android/launcher3/MFVDockExpandSupport;->m:Ljava/util/ArrayList;

    .line 177
    .line 178
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 179
    .line 180
    .line 181
    move-result p1

    .line 182
    if-nez p1, :cond_2

    .line 183
    .line 184
    sget-object p1, Lcom/android/launcher3/MFVDockExpandSupport;->m:Ljava/util/ArrayList;

    .line 185
    .line 186
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 187
    .line 188
    .line 189
    sget-object p1, Lcom/android/launcher3/MFVDockExpandSupport;->m:Ljava/util/ArrayList;

    .line 190
    .line 191
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 192
    .line 193
    .line 194
    :cond_2
    :goto_0
    invoke-virtual {p0, v2}, Lcom/android/launcher3/MFVDockExpandSupport;->y(Z)V

    .line 195
    .line 196
    .line 197
    invoke-direct {p0, v0}, Lcom/android/launcher3/MFVDockExpandSupport;->D(Ljava/util/ArrayList;)V

    .line 198
    .line 199
    .line 200
    return-void
.end method

.method public p()V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "Multi-screen: generateMultiScrCallShareDataList mMultiScreenCallShareSwitchState="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/MFVDockExpandSupport;->i:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "MFVDockExpandSupport"

    .line 21
    .line 22
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    new-instance v0, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Lcom/android/launcher3/MFVDockExpandSupport;->i:Ljava/lang/Boolean;

    .line 31
    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_0

    .line 39
    .line 40
    invoke-direct {p0}, Lcom/android/launcher3/MFVDockExpandSupport;->m()Lcom/android/launcher3/model/data/I;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    sget-object v2, Lcom/android/launcher3/MFVDockExpandSupport;->n:Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 47
    .line 48
    .line 49
    sget-object v2, Lcom/android/launcher3/MFVDockExpandSupport;->n:Ljava/util/ArrayList;

    .line 50
    .line 51
    const/4 v3, 0x0

    .line 52
    invoke-virtual {v2, v3, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    sget-object v1, Lcom/android/launcher3/MFVDockExpandSupport;->n:Ljava/util/ArrayList;

    .line 57
    .line 58
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-nez v1, :cond_1

    .line 63
    .line 64
    sget-object v1, Lcom/android/launcher3/MFVDockExpandSupport;->n:Ljava/util/ArrayList;

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 67
    .line 68
    .line 69
    sget-object v1, Lcom/android/launcher3/MFVDockExpandSupport;->n:Ljava/util/ArrayList;

    .line 70
    .line 71
    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 72
    .line 73
    .line 74
    :cond_1
    :goto_0
    const/4 v1, 0x1

    .line 75
    invoke-virtual {p0, v1}, Lcom/android/launcher3/MFVDockExpandSupport;->y(Z)V

    .line 76
    .line 77
    .line 78
    invoke-direct {p0, v0}, Lcom/android/launcher3/MFVDockExpandSupport;->D(Ljava/util/ArrayList;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public q(Z)V
    .locals 7

    .line 1
    const-string v0, "com.zte.multscr"

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "Multi-screen: generateMultiScrMirrorDataList shouldAdd="

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const-string v2, "MFVDockExpandSupport"

    .line 21
    .line 22
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    new-instance v1, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    iget-object p1, p0, Lcom/android/launcher3/MFVDockExpandSupport;->a:Landroid/content/Context;

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const/4 v3, 0x0

    .line 39
    :try_start_0
    invoke-virtual {p1, v0, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iget-object p1, p1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 44
    .line 45
    if-eqz p1, :cond_0

    .line 46
    .line 47
    new-instance v4, Landroid/content/ComponentName;

    .line 48
    .line 49
    iget-object v5, p1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 50
    .line 51
    iget-object p1, p1, Landroid/content/pm/ApplicationInfo;->className:Ljava/lang/String;

    .line 52
    .line 53
    invoke-direct {v4, v5, p1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    new-instance p1, Landroid/content/Intent;

    .line 57
    .line 58
    const-string v5, "android.intent.action.MAIN"

    .line 59
    .line 60
    invoke-direct {p1, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1, v4}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    iget-object v5, p0, Lcom/android/launcher3/MFVDockExpandSupport;->a:Landroid/content/Context;

    .line 68
    .line 69
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 70
    .line 71
    .line 72
    move-result-object v5

    .line 73
    const v6, 0x7f080f43

    .line 74
    .line 75
    .line 76
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 77
    .line 78
    .line 79
    move-result-object v5

    .line 80
    invoke-direct {p0, v4, p1, v5, v0}, Lcom/android/launcher3/MFVDockExpandSupport;->x(Landroid/content/ComponentName;Landroid/content/Intent;Landroid/graphics/drawable/Drawable;Ljava/lang/String;)Lcom/android/launcher3/model/data/I;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    sget-object v0, Lcom/android/launcher3/MFVDockExpandSupport;->l:Ljava/util/ArrayList;

    .line 85
    .line 86
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 87
    .line 88
    .line 89
    sget-object v0, Lcom/android/launcher3/MFVDockExpandSupport;->l:Ljava/util/ArrayList;

    .line 90
    .line 91
    invoke-virtual {v0, v3, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_0
    new-instance p1, Landroid/content/pm/PackageManager$NameNotFoundException;

    .line 96
    .line 97
    const-string v0, "ApplicationInfo is null"

    .line 98
    .line 99
    invoke-direct {p1, v0}, Landroid/content/pm/PackageManager$NameNotFoundException;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    throw p1
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 103
    :catch_0
    const-string p1, "Multi-screen: Application not installed com.zte.multscr"

    .line 104
    .line 105
    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_1
    sget-object p1, Lcom/android/launcher3/MFVDockExpandSupport;->l:Ljava/util/ArrayList;

    .line 110
    .line 111
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    if-nez p1, :cond_2

    .line 116
    .line 117
    sget-object p1, Lcom/android/launcher3/MFVDockExpandSupport;->l:Ljava/util/ArrayList;

    .line 118
    .line 119
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 120
    .line 121
    .line 122
    sget-object p1, Lcom/android/launcher3/MFVDockExpandSupport;->l:Ljava/util/ArrayList;

    .line 123
    .line 124
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 125
    .line 126
    .line 127
    :cond_2
    :goto_0
    const/4 p1, 0x1

    .line 128
    invoke-virtual {p0, p1}, Lcom/android/launcher3/MFVDockExpandSupport;->y(Z)V

    .line 129
    .line 130
    .line 131
    invoke-direct {p0, v1}, Lcom/android/launcher3/MFVDockExpandSupport;->D(Ljava/util/ArrayList;)V

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method public r()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/I;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/android/launcher3/MFVDockExpandSupport;->j:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public s()Landroid/content/IntentFilter;
    .locals 1

    .line 1
    new-instance p0, Landroid/content/IntentFilter;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/content/IntentFilter;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "com.zte.multscr.ACTION_CAST_CONNECTION_CHANGE"

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "com.zte.multscr.ACTION_BACKGROUND_CAST"

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "relay_service_action_send_bytes"

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string v0, "android.bluetooth.adapter.action.STATE_CHANGED"

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const-string v0, "comm_share_action_phone_info_from_relay_service"

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-object p0
.end method

.method public y(Z)V
    .locals 3

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "recentApp: onHotseatRecentDataListChanged sRecentOpenAppList="

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    sget-object v0, Lcom/android/launcher3/MFVDockExpandSupport;->k:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string v0, "MFVDockExpandSupport"

    .line 25
    .line 26
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    invoke-static {}, Lx1/O;->C3()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    new-instance p0, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .line 39
    .line 40
    sget-object v0, Lcom/android/launcher3/MFVDockExpandSupport;->l:Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    rsub-int/lit8 v0, v0, 0x3

    .line 47
    .line 48
    sget-object v1, Lcom/android/launcher3/MFVDockExpandSupport;->m:Ljava/util/ArrayList;

    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    sub-int/2addr v0, v1

    .line 55
    sget-object v1, Lcom/android/launcher3/MFVDockExpandSupport;->n:Ljava/util/ArrayList;

    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    sub-int/2addr v0, v1

    .line 62
    sget-object v1, Lcom/android/launcher3/MFVDockExpandSupport;->k:Ljava/util/ArrayList;

    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-gt v1, v0, :cond_0

    .line 69
    .line 70
    sget-object v0, Lcom/android/launcher3/MFVDockExpandSupport;->k:Ljava/util/ArrayList;

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_0
    sget-object v1, Lcom/android/launcher3/MFVDockExpandSupport;->k:Ljava/util/ArrayList;

    .line 74
    .line 75
    const/4 v2, 0x0

    .line 76
    invoke-virtual {v1, v2, v0}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    :goto_0
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 81
    .line 82
    .line 83
    sget-object v0, Lcom/android/launcher3/MFVDockExpandSupport;->n:Ljava/util/ArrayList;

    .line 84
    .line 85
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 86
    .line 87
    .line 88
    sget-object v0, Lcom/android/launcher3/MFVDockExpandSupport;->l:Ljava/util/ArrayList;

    .line 89
    .line 90
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 91
    .line 92
    .line 93
    sget-object v0, Lcom/android/launcher3/MFVDockExpandSupport;->m:Ljava/util/ArrayList;

    .line 94
    .line 95
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 96
    .line 97
    .line 98
    sget-object v0, Lcom/android/launcher3/MFVDockExpandSupport;->j:Ljava/util/ArrayList;

    .line 99
    .line 100
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 101
    .line 102
    .line 103
    sget-object v0, Lcom/android/launcher3/MFVDockExpandSupport;->j:Ljava/util/ArrayList;

    .line 104
    .line 105
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 106
    .line 107
    .line 108
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    if-eqz v0, :cond_1

    .line 113
    .line 114
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    if-eqz v0, :cond_1

    .line 123
    .line 124
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-virtual {v0}, Lcom/android/launcher3/Hotseat;->getHotseatRecentCellLayout()Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    if-eqz v0, :cond_1

    .line 137
    .line 138
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-virtual {v0}, Lcom/android/launcher3/Hotseat;->getHotseatRecentCellLayout()Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-virtual {v0, p0, p1}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->Z0(Ljava/util/ArrayList;Z)V

    .line 151
    .line 152
    .line 153
    :cond_1
    return-void
.end method

.method public z(Lcom/android/launcher3/model/data/I;Z)V
    .locals 6

    .line 1
    invoke-static {}, Lx1/O;->C3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    const-string v0, "recentApp: onHotseatRecentDelete"

    .line 8
    .line 9
    const-string v1, "MFVDockExpandSupport"

    .line 10
    .line 11
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    sget-object v0, Lcom/android/launcher3/MFVDockExpandSupport;->k:Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    const/4 v3, 0x1

    .line 29
    iget-object v4, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 30
    .line 31
    const/4 v5, 0x0

    .line 32
    invoke-static {v0, v2, v3, v5, v4}, Lx1/O;->v1(Ljava/util/ArrayList;Landroid/content/ComponentName;ZZLandroid/os/UserHandle;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 41
    .line 42
    .line 43
    const-string v2, "recentApp: onHotseatRecentDelete sRecentOpenAppList="

    .line 44
    .line 45
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    sget-object v2, Lcom/android/launcher3/MFVDockExpandSupport;->k:Ljava/util/ArrayList;

    .line 49
    .line 50
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, p2}, Lcom/android/launcher3/MFVDockExpandSupport;->y(Z)V

    .line 65
    .line 66
    .line 67
    :cond_0
    const-string p2, "com.zte.multscr"

    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    if-eqz p1, :cond_1

    .line 78
    .line 79
    const-string p1, "Multi-screen: onHotseatRecentDelete from recents."

    .line 80
    .line 81
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0, v5}, Lcom/android/launcher3/MFVDockExpandSupport;->q(Z)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/android/launcher3/MFVDockExpandSupport;->k()V

    .line 88
    .line 89
    .line 90
    :cond_1
    return-void
.end method
