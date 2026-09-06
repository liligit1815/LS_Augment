.class Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationUpdateListener$1;
.super Ljava/lang/Object;
.source "AbsSwipeUpHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationUpdateListener;->onUpdate(Landroid/graphics/RectF;FFFF)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationUpdateListener;

.field final synthetic val$max:F


# direct methods
.method constructor <init>(Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationUpdateListener;F)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationUpdateListener$1;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationUpdateListener;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationUpdateListener$1;->val$max:F

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationUpdateListener$1;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationUpdateListener;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationUpdateListener;->$rectFSpringAnim:Lkotlin/jvm/internal/C;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationUpdateListener;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 6
    .line 7
    iget p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationUpdateListener$1;->val$max:F

    .line 8
    .line 9
    invoke-static {v1, v0, p0}, Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationUpdateListener;->onUpdate$lambda$4(Lkotlin/jvm/internal/C;Lcom/android/quickstep/AbsSwipeUpHandler;F)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
