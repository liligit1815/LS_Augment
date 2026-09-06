.class public Ls1/f;
.super Ls1/b;
.source "BubbleIconFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ls1/f$a;,
        Ls1/f$b;
    }
.end annotation


# instance fields
.field private final x:I

.field private final y:I

.field private final z:Ls1/b;


# direct methods
.method public constructor <init>(Landroid/content/Context;IIII)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v0, v0, Landroid/content/res/Configuration;->densityDpi:I

    .line 10
    .line 11
    invoke-direct {p0, p1, v0, p2}, Ls1/b;-><init>(Landroid/content/Context;II)V

    .line 12
    .line 13
    .line 14
    iput p4, p0, Ls1/f;->x:I

    .line 15
    .line 16
    iput p5, p0, Ls1/f;->y:I

    .line 17
    .line 18
    new-instance p2, Ls1/b;

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 21
    .line 22
    .line 23
    move-result-object p4

    .line 24
    invoke-virtual {p4}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 25
    .line 26
    .line 27
    move-result-object p4

    .line 28
    iget p4, p4, Landroid/content/res/Configuration;->densityDpi:I

    .line 29
    .line 30
    invoke-direct {p2, p1, p4, p3}, Ls1/b;-><init>(Landroid/content/Context;II)V

    .line 31
    .line 32
    .line 33
    iput-object p2, p0, Ls1/f;->z:Ls1/b;

    .line 34
    .line 35
    return-void
.end method

.method static bridge synthetic m0(Ls1/f;)I
    .locals 0

    .line 1
    iget p0, p0, Ls1/f;->x:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic n0(Ls1/f;)I
    .locals 0

    .line 1
    iget p0, p0, Ls1/f;->y:I

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public o0(Landroid/graphics/drawable/Drawable;Z)Ls1/d;
    .locals 2

    .line 1
    instance-of v0, p1, Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 6
    .line 7
    new-instance v0, Ls1/f$a;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p1}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getForeground()Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-direct {v0, v1, p1}, Ls1/f$a;-><init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 18
    .line 19
    .line 20
    move-object p1, v0

    .line 21
    :cond_0
    if-eqz p2, :cond_1

    .line 22
    .line 23
    new-instance p2, Ls1/f$b;

    .line 24
    .line 25
    invoke-direct {p2, p0, p1}, Ls1/f$b;-><init>(Ls1/f;Landroid/graphics/drawable/Drawable;)V

    .line 26
    .line 27
    .line 28
    move-object p1, p2

    .line 29
    :cond_1
    iget-object p2, p0, Ls1/f;->z:Ls1/b;

    .line 30
    .line 31
    const/high16 v0, 0x3f800000    # 1.0f

    .line 32
    .line 33
    const/4 v1, 0x2

    .line 34
    invoke-virtual {p2, p1, v0, v1}, Ls1/b;->n(Landroid/graphics/drawable/Drawable;FI)Landroid/graphics/Bitmap;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-object p0, p0, Ls1/f;->z:Ls1/b;

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Ls1/b;->v(Landroid/graphics/Bitmap;)Ls1/d;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public p0(Landroid/graphics/drawable/Drawable;[F)Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    const/4 p2, 0x1

    .line 4
    new-array p2, p2, [F

    .line 5
    .line 6
    :cond_0
    invoke-virtual {p0, p1, p2}, Ls1/b;->e0(Landroid/graphics/drawable/Drawable;[F)Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/4 v0, 0x0

    .line 11
    aget p2, p2, v0

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    invoke-virtual {p0, p1, p2, v0}, Ls1/b;->n(Landroid/graphics/drawable/Drawable;FI)Landroid/graphics/Bitmap;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public q0(Landroid/content/Context;Landroid/content/pm/ShortcutInfo;Landroid/graphics/drawable/Icon;)Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    const-class p0, Landroid/content/pm/LauncherApps;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Landroid/content/pm/LauncherApps;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget p1, p1, Landroid/content/res/Configuration;->densityDpi:I

    .line 20
    .line 21
    invoke-virtual {p0, p2, p1}, Landroid/content/pm/LauncherApps;->getShortcutIconDrawable(Landroid/content/pm/ShortcutInfo;I)Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_0
    if-eqz p3, :cond_3

    .line 27
    .line 28
    invoke-virtual {p3}, Landroid/graphics/drawable/Icon;->getType()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    const/4 p2, 0x4

    .line 33
    if-eq p0, p2, :cond_1

    .line 34
    .line 35
    invoke-virtual {p3}, Landroid/graphics/drawable/Icon;->getType()I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    const/4 p2, 0x6

    .line 40
    if-ne p0, p2, :cond_2

    .line 41
    .line 42
    :cond_1
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p3}, Landroid/graphics/drawable/Icon;->getUri()Landroid/net/Uri;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    const/4 v0, 0x1

    .line 51
    invoke-virtual {p1, p0, p2, v0}, Landroid/content/Context;->grantUriPermission(Ljava/lang/String;Landroid/net/Uri;I)V

    .line 52
    .line 53
    .line 54
    :cond_2
    invoke-virtual {p3, p1}, Landroid/graphics/drawable/Icon;->loadDrawable(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0

    .line 59
    :cond_3
    const/4 p0, 0x0

    .line 60
    return-object p0
.end method
