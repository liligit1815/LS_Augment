.class Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;
.super Ljava/lang/Object;
.source "FloatingWidgetBackgroundView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/views/FloatingWidgetBackgroundView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DrawableProperties"
.end annotation


# instance fields
.field private mDrawable:Landroid/graphics/drawable/Drawable;

.field private mOriginalRadii:[F

.field private mOriginalRadius:F

.field private final mTmpRadii:[F


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x8

    .line 3
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;->mTmpRadii:[F

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/quickstep/views/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;-><init>()V

    return-void
.end method

.method static bridge synthetic a(Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method init(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    instance-of v0, p1, Landroid/graphics/drawable/GradientDrawable;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    check-cast p1, Landroid/graphics/drawable/GradientDrawable;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/graphics/drawable/GradientDrawable;->getCornerRadius()F

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput v0, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;->mOriginalRadius:F

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/graphics/drawable/GradientDrawable;->getCornerRadii()[F

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;->mOriginalRadii:[F

    .line 21
    .line 22
    return-void
.end method

.method updateDrawable(FF)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    instance-of v1, v0, Landroid/graphics/drawable/GradientDrawable;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    check-cast v0, Landroid/graphics/drawable/GradientDrawable;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;->mOriginalRadii:[F

    .line 11
    .line 12
    if-eqz v1, :cond_2

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    :goto_0
    iget-object v2, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;->mOriginalRadii:[F

    .line 16
    .line 17
    array-length v3, v2

    .line 18
    if-ge v1, v3, :cond_1

    .line 19
    .line 20
    iget-object v3, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;->mTmpRadii:[F

    .line 21
    .line 22
    aget v2, v2, v1

    .line 23
    .line 24
    sub-float v4, p1, v2

    .line 25
    .line 26
    mul-float/2addr v4, p2

    .line 27
    add-float/2addr v2, v4

    .line 28
    aput v2, v3, v1

    .line 29
    .line 30
    add-int/lit8 v1, v1, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;->mTmpRadii:[F

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_2
    iget p0, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;->mOriginalRadius:F

    .line 40
    .line 41
    sub-float/2addr p1, p0

    .line 42
    mul-float/2addr p1, p2

    .line 43
    add-float/2addr p0, p1

    .line 44
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 45
    .line 46
    .line 47
    return-void
.end method
