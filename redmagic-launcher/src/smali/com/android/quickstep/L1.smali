.class public final synthetic Lcom/android/quickstep/L1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

.field public final synthetic h:Lcom/android/quickstep/AbsSwipeUpHandler;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/L1;->g:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/L1;->h:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/L1;->g:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/L1;->h:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$recentAnimListener$1;->a(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
