.class public LT0/p$h;
.super Landroid/util/FloatProperty;
.source "FolderAnimationManagerMFV.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LT0/p;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "h"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/util/FloatProperty<",
        "Landroid/view/View;",
        ">;"
    }
.end annotation


# instance fields
.field private final a:F

.field private b:F


# direct methods
.method public constructor <init>(F)V
    .locals 1

    .line 1
    const-string v0, "viewBlur"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Landroid/util/FloatProperty;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput p1, p0, LT0/p$h;->a:F

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;)Ljava/lang/Float;
    .locals 0

    .line 1
    iget p0, p0, LT0/p$h;->b:F

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b(Landroid/view/View;F)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/high16 v1, 0x3f800000    # 1.0f

    .line 3
    .line 4
    invoke-static {p2, v0, v1}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    iget v0, p0, LT0/p$h;->a:F

    .line 9
    .line 10
    mul-float/2addr p2, v0

    .line 11
    iput p2, p0, LT0/p$h;->b:F

    .line 12
    .line 13
    sget-object p0, Landroid/graphics/Shader$TileMode;->DECAL:Landroid/graphics/Shader$TileMode;

    .line 14
    .line 15
    invoke-static {p2, p2, p0}, Landroid/graphics/RenderEffect;->createBlurEffect(FFLandroid/graphics/Shader$TileMode;)Landroid/graphics/RenderEffect;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1, p0}, Landroid/view/View;->setRenderEffect(Landroid/graphics/RenderEffect;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LT0/p$h;->a(Landroid/view/View;)Ljava/lang/Float;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic setValue(Ljava/lang/Object;F)V
    .locals 0

    .line 1
    check-cast p1, Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, LT0/p$h;->b(Landroid/view/View;F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
