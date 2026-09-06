.class public final Lcom/android/launcher3/Y4;
.super Ljava/lang/Object;
.source "PillColorPorovider.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/Y4$a;
    }
.end annotation


# static fields
.field public static final h:Lcom/android/launcher3/Y4$a;

.field private static i:Lcom/android/launcher3/Y4;


# instance fields
.field private final a:Landroid/content/Context;

.field private final b:Lh4/e;

.field private c:Landroid/graphics/Paint;

.field private d:Landroid/graphics/Paint;

.field private e:I

.field private f:Z

.field private final g:Lcom/android/launcher3/Y4$b;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/Y4$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/launcher3/Y4$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/launcher3/Y4;->h:Lcom/android/launcher3/Y4$a;

    .line 8
    .line 9
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/Y4;->a:Landroid/content/Context;

    .line 4
    new-instance p1, Lcom/android/launcher3/X4;

    invoke-direct {p1}, Lcom/android/launcher3/X4;-><init>()V

    invoke-static {p1}, Lh4/f;->b(Lu4/a;)Lh4/e;

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/Y4;->b:Lh4/e;

    .line 5
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/Y4;->c:Landroid/graphics/Paint;

    .line 6
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/Y4;->d:Landroid/graphics/Paint;

    .line 7
    iget p1, p0, Lcom/android/launcher3/Y4;->e:I

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Lcom/android/launcher3/Y4;->f:Z

    .line 8
    sget-object p1, Lcom/android/launcher3/util/m0;->d:Lcom/android/launcher3/util/p1;

    invoke-virtual {p1}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    move-result-object p1

    new-instance v0, Lcom/android/launcher3/Y4$b;

    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/Y4$b;-><init>(Lcom/android/launcher3/Y4;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/android/launcher3/Y4;->g:Lcom/android/launcher3/Y4$b;

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/Y4;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic a()Landroid/net/Uri;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/Y4;->m()Landroid/net/Uri;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static final synthetic b(Lcom/android/launcher3/Y4;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Y4;->a:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic c()Lcom/android/launcher3/Y4;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/Y4;->i:Lcom/android/launcher3/Y4;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic d(Lcom/android/launcher3/Y4;)Landroid/net/Uri;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/Y4;->k()Landroid/net/Uri;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic e(Lcom/android/launcher3/Y4;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/Y4;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic f(Lcom/android/launcher3/Y4;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/android/launcher3/Y4;->i:Lcom/android/launcher3/Y4;

    .line 2
    .line 3
    return-void
.end method

.method public static final synthetic g(Lcom/android/launcher3/Y4;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/Y4;->e:I

    .line 2
    .line 3
    return-void
.end method

.method public static final j(Landroid/content/Context;)Lcom/android/launcher3/Y4;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/Y4;->h:Lcom/android/launcher3/Y4$a;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/Y4$a;->a(Landroid/content/Context;)Lcom/android/launcher3/Y4;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private final k()Landroid/net/Uri;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Y4;->b:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/net/Uri;

    .line 8
    .line 9
    return-object p0
.end method

.method private static final m()Landroid/net/Uri;
    .locals 1

    .line 1
    const-string v0, "matcha_enable"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method


# virtual methods
.method public final h()Landroid/graphics/Paint;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Y4;->c:Landroid/graphics/Paint;

    .line 2
    .line 3
    return-object p0
.end method

.method public final i()Landroid/graphics/Paint;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Y4;->d:Landroid/graphics/Paint;

    .line 2
    .line 3
    return-object p0
.end method

.method public final l()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/Y4;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public final n()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Y4;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/Y4;->k()Landroid/net/Uri;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/4 v2, 0x0

    .line 12
    iget-object v3, p0, Lcom/android/launcher3/Y4;->g:Lcom/android/launcher3/Y4$b;

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/Y4;->p()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final o(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/Y4;->f:Z

    .line 2
    .line 3
    return-void
.end method

.method public final p()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Y4;->c:Landroid/graphics/Paint;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/Y4;->a:Landroid/content/Context;

    .line 4
    .line 5
    const v2, 0x7f06045c

    .line 6
    .line 7
    .line 8
    invoke-virtual {v1, v2}, Landroid/content/Context;->getColor(I)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/Y4;->d:Landroid/graphics/Paint;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/android/launcher3/Y4;->a:Landroid/content/Context;

    .line 18
    .line 19
    const v2, 0x7f06044a

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, v2}, Landroid/content/Context;->getColor(I)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/launcher3/Y4;->a:Landroid/content/Context;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "matcha_enable"

    .line 36
    .line 37
    const/4 v2, 0x0

    .line 38
    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Lcom/android/launcher3/Y4;->e:I

    .line 43
    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    const/4 v2, 0x1

    .line 47
    :cond_0
    iput-boolean v2, p0, Lcom/android/launcher3/Y4;->f:Z

    .line 48
    .line 49
    return-void
.end method

.method public final q()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Y4;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/android/launcher3/Y4;->g:Lcom/android/launcher3/Y4$b;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
