.class public final Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;
.super Ljava/lang/Object;
.source "SplitAnimationController.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/SplitAnimationController$Companion;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "SplitAnimInitProps"
.end annotation


# instance fields
.field private final contentDescription:Ljava/lang/CharSequence;

.field private final fadeWithThumbnail:Z

.field private final iconDrawable:Landroid/graphics/drawable/Drawable;

.field private final iconView:Landroid/view/View;

.field private final isStagedTask:Z

.field private final originalBitmap:Landroid/graphics/Bitmap;

.field private final originalView:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;Landroid/graphics/Bitmap;Landroid/graphics/drawable/Drawable;ZZLandroid/view/View;Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    const-string v0, "originalView"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "iconDrawable"

    .line 7
    .line 8
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->originalView:Landroid/view/View;

    .line 15
    .line 16
    iput-object p2, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->originalBitmap:Landroid/graphics/Bitmap;

    .line 17
    .line 18
    iput-object p3, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->iconDrawable:Landroid/graphics/drawable/Drawable;

    .line 19
    .line 20
    iput-boolean p4, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->fadeWithThumbnail:Z

    .line 21
    .line 22
    iput-boolean p5, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->isStagedTask:Z

    .line 23
    .line 24
    iput-object p6, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->iconView:Landroid/view/View;

    .line 25
    .line 26
    iput-object p7, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->contentDescription:Ljava/lang/CharSequence;

    .line 27
    .line 28
    return-void
.end method

.method public static synthetic copy$default(Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;Landroid/view/View;Landroid/graphics/Bitmap;Landroid/graphics/drawable/Drawable;ZZLandroid/view/View;Ljava/lang/CharSequence;ILjava/lang/Object;)Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;
    .locals 0

    .line 1
    and-int/lit8 p9, p8, 0x1

    .line 2
    .line 3
    if-eqz p9, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->originalView:Landroid/view/View;

    .line 6
    .line 7
    :cond_0
    and-int/lit8 p9, p8, 0x2

    .line 8
    .line 9
    if-eqz p9, :cond_1

    .line 10
    .line 11
    iget-object p2, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->originalBitmap:Landroid/graphics/Bitmap;

    .line 12
    .line 13
    :cond_1
    and-int/lit8 p9, p8, 0x4

    .line 14
    .line 15
    if-eqz p9, :cond_2

    .line 16
    .line 17
    iget-object p3, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->iconDrawable:Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    :cond_2
    and-int/lit8 p9, p8, 0x8

    .line 20
    .line 21
    if-eqz p9, :cond_3

    .line 22
    .line 23
    iget-boolean p4, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->fadeWithThumbnail:Z

    .line 24
    .line 25
    :cond_3
    and-int/lit8 p9, p8, 0x10

    .line 26
    .line 27
    if-eqz p9, :cond_4

    .line 28
    .line 29
    iget-boolean p5, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->isStagedTask:Z

    .line 30
    .line 31
    :cond_4
    and-int/lit8 p9, p8, 0x20

    .line 32
    .line 33
    if-eqz p9, :cond_5

    .line 34
    .line 35
    iget-object p6, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->iconView:Landroid/view/View;

    .line 36
    .line 37
    :cond_5
    and-int/lit8 p8, p8, 0x40

    .line 38
    .line 39
    if-eqz p8, :cond_6

    .line 40
    .line 41
    iget-object p7, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->contentDescription:Ljava/lang/CharSequence;

    .line 42
    .line 43
    :cond_6
    move-object p8, p6

    .line 44
    move-object p9, p7

    .line 45
    move p6, p4

    .line 46
    move p7, p5

    .line 47
    move-object p4, p2

    .line 48
    move-object p5, p3

    .line 49
    move-object p2, p0

    .line 50
    move-object p3, p1

    .line 51
    invoke-virtual/range {p2 .. p9}, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->copy(Landroid/view/View;Landroid/graphics/Bitmap;Landroid/graphics/drawable/Drawable;ZZLandroid/view/View;Ljava/lang/CharSequence;)Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0
.end method


# virtual methods
.method public final component1()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->originalView:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public final component2()Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->originalBitmap:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p0
.end method

.method public final component3()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->iconDrawable:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public final component4()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->fadeWithThumbnail:Z

    .line 2
    .line 3
    return p0
.end method

.method public final component5()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->isStagedTask:Z

    .line 2
    .line 3
    return p0
.end method

.method public final component6()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->iconView:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public final component7()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->contentDescription:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public final copy(Landroid/view/View;Landroid/graphics/Bitmap;Landroid/graphics/drawable/Drawable;ZZLandroid/view/View;Ljava/lang/CharSequence;)Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;
    .locals 8

    .line 1
    const-string p0, "originalView"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "iconDrawable"

    .line 7
    .line 8
    invoke-static {p3, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;

    .line 12
    .line 13
    move-object v1, p1

    .line 14
    move-object v2, p2

    .line 15
    move-object v3, p3

    .line 16
    move v4, p4

    .line 17
    move v5, p5

    .line 18
    move-object v6, p6

    .line 19
    move-object v7, p7

    .line 20
    invoke-direct/range {v0 .. v7}, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;-><init>(Landroid/view/View;Landroid/graphics/Bitmap;Landroid/graphics/drawable/Drawable;ZZLandroid/view/View;Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->originalView:Landroid/view/View;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->originalView:Landroid/view/View;

    .line 16
    .line 17
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_2

    .line 22
    .line 23
    return v2

    .line 24
    :cond_2
    iget-object v1, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->originalBitmap:Landroid/graphics/Bitmap;

    .line 25
    .line 26
    iget-object v3, p1, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->originalBitmap:Landroid/graphics/Bitmap;

    .line 27
    .line 28
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-nez v1, :cond_3

    .line 33
    .line 34
    return v2

    .line 35
    :cond_3
    iget-object v1, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->iconDrawable:Landroid/graphics/drawable/Drawable;

    .line 36
    .line 37
    iget-object v3, p1, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->iconDrawable:Landroid/graphics/drawable/Drawable;

    .line 38
    .line 39
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-nez v1, :cond_4

    .line 44
    .line 45
    return v2

    .line 46
    :cond_4
    iget-boolean v1, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->fadeWithThumbnail:Z

    .line 47
    .line 48
    iget-boolean v3, p1, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->fadeWithThumbnail:Z

    .line 49
    .line 50
    if-eq v1, v3, :cond_5

    .line 51
    .line 52
    return v2

    .line 53
    :cond_5
    iget-boolean v1, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->isStagedTask:Z

    .line 54
    .line 55
    iget-boolean v3, p1, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->isStagedTask:Z

    .line 56
    .line 57
    if-eq v1, v3, :cond_6

    .line 58
    .line 59
    return v2

    .line 60
    :cond_6
    iget-object v1, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->iconView:Landroid/view/View;

    .line 61
    .line 62
    iget-object v3, p1, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->iconView:Landroid/view/View;

    .line 63
    .line 64
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-nez v1, :cond_7

    .line 69
    .line 70
    return v2

    .line 71
    :cond_7
    iget-object p0, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->contentDescription:Ljava/lang/CharSequence;

    .line 72
    .line 73
    iget-object p1, p1, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->contentDescription:Ljava/lang/CharSequence;

    .line 74
    .line 75
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    if-nez p0, :cond_8

    .line 80
    .line 81
    return v2

    .line 82
    :cond_8
    return v0
.end method

.method public final getContentDescription()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->contentDescription:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getFadeWithThumbnail()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->fadeWithThumbnail:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getIconDrawable()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->iconDrawable:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getIconView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->iconView:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getOriginalBitmap()Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->originalBitmap:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getOriginalView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->originalView:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->originalView:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/lit8 v0, v0, 0x1f

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->originalBitmap:Landroid/graphics/Bitmap;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    move v1, v2

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->hashCode()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    :goto_0
    add-int/2addr v0, v1

    .line 21
    mul-int/lit8 v0, v0, 0x1f

    .line 22
    .line 23
    iget-object v1, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->iconDrawable:Landroid/graphics/drawable/Drawable;

    .line 24
    .line 25
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->hashCode()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    add-int/2addr v0, v1

    .line 30
    mul-int/lit8 v0, v0, 0x1f

    .line 31
    .line 32
    iget-boolean v1, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->fadeWithThumbnail:Z

    .line 33
    .line 34
    invoke-static {v1}, Ljava/lang/Boolean;->hashCode(Z)I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    add-int/2addr v0, v1

    .line 39
    mul-int/lit8 v0, v0, 0x1f

    .line 40
    .line 41
    iget-boolean v1, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->isStagedTask:Z

    .line 42
    .line 43
    invoke-static {v1}, Ljava/lang/Boolean;->hashCode(Z)I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    add-int/2addr v0, v1

    .line 48
    mul-int/lit8 v0, v0, 0x1f

    .line 49
    .line 50
    iget-object v1, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->iconView:Landroid/view/View;

    .line 51
    .line 52
    if-nez v1, :cond_1

    .line 53
    .line 54
    move v1, v2

    .line 55
    goto :goto_1

    .line 56
    :cond_1
    invoke-virtual {v1}, Landroid/view/View;->hashCode()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    :goto_1
    add-int/2addr v0, v1

    .line 61
    mul-int/lit8 v0, v0, 0x1f

    .line 62
    .line 63
    iget-object p0, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->contentDescription:Ljava/lang/CharSequence;

    .line 64
    .line 65
    if-nez p0, :cond_2

    .line 66
    .line 67
    goto :goto_2

    .line 68
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    :goto_2
    add-int/2addr v0, v2

    .line 73
    return v0
.end method

.method public final isStagedTask()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->isStagedTask:Z

    .line 2
    .line 3
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->originalView:Landroid/view/View;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->originalBitmap:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->iconDrawable:Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    iget-boolean v3, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->fadeWithThumbnail:Z

    .line 8
    .line 9
    iget-boolean v4, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->isStagedTask:Z

    .line 10
    .line 11
    iget-object v5, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->iconView:Landroid/view/View;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;->contentDescription:Ljava/lang/CharSequence;

    .line 14
    .line 15
    new-instance v6, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v7, "SplitAnimInitProps(originalView="

    .line 21
    .line 22
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v0, ", originalBitmap="

    .line 29
    .line 30
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v0, ", iconDrawable="

    .line 37
    .line 38
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v0, ", fadeWithThumbnail="

    .line 45
    .line 46
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v0, ", isStagedTask="

    .line 53
    .line 54
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string v0, ", iconView="

    .line 61
    .line 62
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string v0, ", contentDescription="

    .line 69
    .line 70
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    const-string p0, ")"

    .line 77
    .line 78
    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    return-object p0
.end method
