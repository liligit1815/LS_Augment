.class public final synthetic Lcom/android/quickstep/I5;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/launcher3/util/a2;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/TopTaskTracker;

.field public final synthetic h:Lcom/android/quickstep/SystemUiProxy;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/TopTaskTracker;Lcom/android/quickstep/SystemUiProxy;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/I5;->g:Lcom/android/quickstep/TopTaskTracker;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/I5;->h:Lcom/android/quickstep/SystemUiProxy;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final close()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/I5;->g:Lcom/android/quickstep/TopTaskTracker;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/I5;->h:Lcom/android/quickstep/SystemUiProxy;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/android/quickstep/TopTaskTracker;->D2(Lcom/android/quickstep/TopTaskTracker;Lcom/android/quickstep/SystemUiProxy;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
