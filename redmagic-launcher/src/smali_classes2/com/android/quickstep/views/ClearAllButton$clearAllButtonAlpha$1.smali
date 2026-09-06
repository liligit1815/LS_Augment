.class public final Lcom/android/quickstep/views/ClearAllButton$clearAllButtonAlpha$1;
.super Lcom/android/launcher3/util/B1;
.source "ClearAllButton.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/views/ClearAllButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/views/ClearAllButton;


# direct methods
.method constructor <init>(Lcom/android/quickstep/views/ClearAllButton;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/ClearAllButton$clearAllButtonAlpha$1;->this$0:Lcom/android/quickstep/views/ClearAllButton;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/util/B1;-><init>(Landroid/view/View;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method protected apply(F)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/util/B1;->apply(F)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/quickstep/views/ClearAllButton$clearAllButtonAlpha$1;->this$0:Lcom/android/quickstep/views/ClearAllButton;

    .line 5
    .line 6
    const/high16 v0, 0x3f800000    # 1.0f

    .line 7
    .line 8
    cmpl-float p1, p1, v0

    .line 9
    .line 10
    if-ltz p1, :cond_0

    .line 11
    .line 12
    const/4 p1, 0x1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p1, 0x0

    .line 15
    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/Button;->setClickable(Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
