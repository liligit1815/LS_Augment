.class public final synthetic Lcom/android/quickstep/util/h1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;

.field public final synthetic h:Lcom/android/quickstep/RecentsAnimationCallbacks;

.field public final synthetic i:Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;Lcom/android/quickstep/RecentsAnimationCallbacks;Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/h1;->g:Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/util/h1;->h:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/util/h1;->i:Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/h1;->g:Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/util/h1;->h:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/util/h1;->i:Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;->b(Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;Lcom/android/quickstep/RecentsAnimationCallbacks;Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
