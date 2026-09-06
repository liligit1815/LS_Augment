.class public final synthetic Lcom/android/quickstep/fallback/window/p;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;

.field public final synthetic h:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/fallback/window/p;->g:Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/fallback/window/p;->h:Ljava/lang/Runnable;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/fallback/window/p;->g:Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/p;->h:Ljava/lang/Runnable;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;->x0(Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
