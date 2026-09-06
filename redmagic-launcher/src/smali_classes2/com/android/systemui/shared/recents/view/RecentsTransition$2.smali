.class Lcom/android/systemui/shared/recents/view/RecentsTransition$2;
.super Ljava/lang/Object;
.source "RecentsTransition.java"

# interfaces
.implements Ljava/util/function/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/shared/recents/view/RecentsTransition;->drawViewIntoHardwareBitmap(IILandroid/view/View;FI)Landroid/graphics/Bitmap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/function/Consumer<",
        "Landroid/graphics/Canvas;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$eraseColor:I

.field final synthetic val$scale:F

.field final synthetic val$view:Landroid/view/View;


# direct methods
.method constructor <init>(FILandroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput p1, p0, Lcom/android/systemui/shared/recents/view/RecentsTransition$2;->val$scale:F

    .line 2
    .line 3
    iput p2, p0, Lcom/android/systemui/shared/recents/view/RecentsTransition$2;->val$eraseColor:I

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/systemui/shared/recents/view/RecentsTransition$2;->val$view:Landroid/view/View;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public accept(Landroid/graphics/Canvas;)V
    .locals 1

    .line 2
    iget v0, p0, Lcom/android/systemui/shared/recents/view/RecentsTransition$2;->val$scale:F

    invoke-virtual {p1, v0, v0}, Landroid/graphics/Canvas;->scale(FF)V

    .line 3
    iget v0, p0, Lcom/android/systemui/shared/recents/view/RecentsTransition$2;->val$eraseColor:I

    if-eqz v0, :cond_0

    .line 4
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 5
    :cond_0
    iget-object p0, p0, Lcom/android/systemui/shared/recents/view/RecentsTransition$2;->val$view:Landroid/view/View;

    if-eqz p0, :cond_1

    .line 6
    invoke-virtual {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    :cond_1
    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/graphics/Canvas;

    invoke-virtual {p0, p1}, Lcom/android/systemui/shared/recents/view/RecentsTransition$2;->accept(Landroid/graphics/Canvas;)V

    return-void
.end method
