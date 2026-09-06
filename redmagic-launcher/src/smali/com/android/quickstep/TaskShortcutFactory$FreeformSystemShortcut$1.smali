.class Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut$1;
.super Lcom/android/systemui/shared/recents/view/AppTransitionAnimationSpecsFuture;
.source "TaskShortcutFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;->startActivity()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$taskBounds:Landroid/graphics/Rect;

.field final synthetic val$taskId:I

.field final synthetic val$thumbnail:Landroid/graphics/Bitmap;


# direct methods
.method constructor <init>(Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;Landroid/os/Handler;ILandroid/graphics/Bitmap;Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    iput p3, p0, Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut$1;->val$taskId:I

    .line 2
    .line 3
    iput-object p4, p0, Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut$1;->val$thumbnail:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    iput-object p5, p0, Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut$1;->val$taskBounds:Landroid/graphics/Rect;

    .line 6
    .line 7
    invoke-direct {p0, p2}, Lcom/android/systemui/shared/recents/view/AppTransitionAnimationSpecsFuture;-><init>(Landroid/os/Handler;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public composeSpecs()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/systemui/shared/recents/view/AppTransitionAnimationSpecCompat;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/systemui/shared/recents/view/AppTransitionAnimationSpecCompat;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut$1;->val$taskId:I

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut$1;->val$thumbnail:Landroid/graphics/Bitmap;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut$1;->val$taskBounds:Landroid/graphics/Rect;

    .line 8
    .line 9
    invoke-direct {v0, v1, v2, p0}, Lcom/android/systemui/shared/recents/view/AppTransitionAnimationSpecCompat;-><init>(ILandroid/graphics/Bitmap;Landroid/graphics/Rect;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method
