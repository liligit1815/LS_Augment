.class public final synthetic Lcom/android/quickstep/util/i1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/quickstep/TaskIconCache$GetTaskIconCallback;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/views/FloatingTaskView;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/views/FloatingTaskView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/i1;->a:Lcom/android/quickstep/views/FloatingTaskView;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onTaskIconReceived(Landroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/i1;->a:Lcom/android/quickstep/views/FloatingTaskView;

    .line 2
    .line 3
    invoke-static {p0, p1, p2, p3}, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;->a(Lcom/android/quickstep/views/FloatingTaskView;Landroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
