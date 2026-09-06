.class public abstract LV0/a;
.super Ljava/lang/Object;
.source "AbstractParticle.java"


# instance fields
.field a:F

.field b:F

.field c:I


# direct methods
.method public constructor <init>(IFF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, LV0/a;->c:I

    .line 5
    .line 6
    iput p2, p0, LV0/a;->a:F

    .line 7
    .line 8
    iput p3, p0, LV0/a;->b:F

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Canvas;Landroid/graphics/Paint;F)V
    .locals 0

    .line 1
    invoke-virtual {p0, p3}, LV0/a;->b(F)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p2}, LV0/a;->c(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method protected abstract b(F)V
.end method

.method protected abstract c(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V
.end method
