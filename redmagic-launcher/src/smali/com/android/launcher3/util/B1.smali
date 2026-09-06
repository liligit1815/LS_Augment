.class public Lcom/android/launcher3/util/B1;
.super Lcom/android/launcher3/util/v1;
.source "MultiValueAlpha.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/launcher3/util/v1<",
        "Landroid/view/View;",
        ">;"
    }
.end annotation


# static fields
.field private static final ALPHA_AGGREGATOR:Lcom/android/launcher3/util/v1$b;


# instance fields
.field private final mHiddenVisibility:I

.field private mUpdateVisibility:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/util/A1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/util/A1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/util/B1;->ALPHA_AGGREGATOR:Lcom/android/launcher3/util/v1$b;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/view/View;I)V
    .locals 1

    const/4 v0, 0x4

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/util/B1;-><init>(Landroid/view/View;II)V

    return-void
.end method

.method public constructor <init>(Landroid/view/View;II)V
    .locals 6

    .line 2
    sget-object v2, Lcom/android/launcher3/G2;->k:Landroid/util/FloatProperty;

    sget-object v4, Lcom/android/launcher3/util/B1;->ALPHA_AGGREGATOR:Lcom/android/launcher3/util/v1$b;

    const/high16 v5, 0x3f800000    # 1.0f

    move-object v0, p0

    move-object v1, p1

    move v3, p2

    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/util/v1;-><init>(Ljava/lang/Object;Landroid/util/FloatProperty;ILcom/android/launcher3/util/v1$b;F)V

    .line 3
    iput p3, v0, Lcom/android/launcher3/util/B1;->mHiddenVisibility:I

    return-void
.end method

.method public static synthetic g(FF)F
    .locals 0

    .line 1
    mul-float/2addr p0, p1

    .line 2
    return p0
.end method


# virtual methods
.method protected apply(F)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/util/v1;->apply(F)V

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p0, Lcom/android/launcher3/util/B1;->mUpdateVisibility:Z

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/launcher3/util/v1;->mTarget:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast p1, Landroid/view/View;

    .line 11
    .line 12
    iget p0, p0, Lcom/android/launcher3/util/B1;->mHiddenVisibility:I

    .line 13
    .line 14
    invoke-static {p1, p0}, Lcom/android/launcher3/anim/a;->b(Landroid/view/View;I)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public setUpdateVisibility(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/util/B1;->mUpdateVisibility:Z

    .line 2
    .line 3
    return-void
.end method
