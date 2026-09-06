.class public Ls1/T$c;
.super Ljava/lang/Object;
.source "IconProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ls1/T;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field final a:Landroid/content/res/Resources;

.field final b:I


# direct methods
.method public constructor <init>(Landroid/content/res/Resources;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ls1/T$c;->a:Landroid/content/res/Resources;

    .line 5
    .line 6
    iput p2, p0, Ls1/T$c;->b:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method a()Landroid/graphics/drawable/Drawable;
    .locals 3

    .line 1
    iget-object v0, p0, Ls1/T$c;->a:Landroid/content/res/Resources;

    .line 2
    .line 3
    iget v1, p0, Ls1/T$c;->b:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getResourceTypeName(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "drawable"

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return-object p0

    .line 19
    :cond_0
    iget-object v0, p0, Ls1/T$c;->a:Landroid/content/res/Resources;

    .line 20
    .line 21
    iget p0, p0, Ls1/T$c;->b:I

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    new-instance v0, Landroid/graphics/drawable/InsetDrawable;

    .line 32
    .line 33
    const v1, 0x3e4ccccd    # 0.2f

    .line 34
    .line 35
    .line 36
    invoke-direct {v0, p0, v1}, Landroid/graphics/drawable/InsetDrawable;-><init>(Landroid/graphics/drawable/Drawable;F)V

    .line 37
    .line 38
    .line 39
    invoke-static {}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getExtraInsetFraction()F

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    const/high16 v1, 0x40000000    # 2.0f

    .line 44
    .line 45
    invoke-static {}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getExtraInsetFraction()F

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    mul-float/2addr v2, v1

    .line 50
    const/high16 v1, 0x3f800000    # 1.0f

    .line 51
    .line 52
    add-float/2addr v2, v1

    .line 53
    div-float/2addr p0, v2

    .line 54
    new-instance v1, Landroid/graphics/drawable/InsetDrawable;

    .line 55
    .line 56
    invoke-direct {v1, v0, p0}, Landroid/graphics/drawable/InsetDrawable;-><init>(Landroid/graphics/drawable/Drawable;F)V

    .line 57
    .line 58
    .line 59
    return-object v1
.end method
