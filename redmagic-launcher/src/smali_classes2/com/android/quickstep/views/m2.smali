.class public final synthetic Lcom/android/quickstep/views/m2;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Supplier;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/views/TaskView;

.field public final synthetic b:Lcom/android/quickstep/views/TaskContainer;

.field public final synthetic c:Landroid/view/accessibility/AccessibilityNodeInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskContainer;Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/views/m2;->a:Lcom/android/quickstep/views/TaskView;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/views/m2;->b:Lcom/android/quickstep/views/TaskContainer;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/views/m2;->c:Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/m2;->a:Lcom/android/quickstep/views/TaskView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/views/m2;->b:Lcom/android/quickstep/views/TaskContainer;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/views/m2;->c:Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/android/quickstep/views/TaskView;->v(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskContainer;Landroid/view/accessibility/AccessibilityNodeInfo;)Lh4/t;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
