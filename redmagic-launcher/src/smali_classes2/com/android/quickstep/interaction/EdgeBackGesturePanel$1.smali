.class Lcom/android/quickstep/interaction/EdgeBackGesturePanel$1;
.super Ljava/lang/Object;
.source "EdgeBackGesturePanel.java"

# interfaces
.implements Landroidx/dynamicanimation/animation/e$q;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/interaction/EdgeBackGesturePanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/interaction/EdgeBackGesturePanel;


# direct methods
.method constructor <init>(Lcom/android/quickstep/interaction/EdgeBackGesturePanel;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel$1;->this$0:Lcom/android/quickstep/interaction/EdgeBackGesturePanel;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroidx/dynamicanimation/animation/e;ZFF)V
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Landroidx/dynamicanimation/animation/e;->i(Landroidx/dynamicanimation/animation/e$q;)V

    .line 2
    .line 3
    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel$1;->this$0:Lcom/android/quickstep/interaction/EdgeBackGesturePanel;

    .line 7
    .line 8
    const/16 p1, 0x8

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method
