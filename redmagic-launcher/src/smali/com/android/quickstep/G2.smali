.class public final synthetic Lcom/android/quickstep/G2;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/TopTaskTracker;

.field public final synthetic h:Lcom/android/wm/shell/shared/i;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/TopTaskTracker;Lcom/android/wm/shell/shared/i;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/G2;->g:Lcom/android/quickstep/TopTaskTracker;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/G2;->h:Lcom/android/wm/shell/shared/i;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/G2;->g:Lcom/android/quickstep/TopTaskTracker;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/G2;->h:Lcom/android/wm/shell/shared/i;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/android/quickstep/RecentTasksList$1;->o2(Lcom/android/quickstep/TopTaskTracker;Lcom/android/wm/shell/shared/i;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
