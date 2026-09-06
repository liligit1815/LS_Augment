.class public final synthetic Lcom/android/quickstep/utils/l;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/utils/EarlyPauseAppUtils;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/utils/EarlyPauseAppUtils;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/utils/l;->g:Lcom/android/quickstep/utils/EarlyPauseAppUtils;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/utils/l;->g:Lcom/android/quickstep/utils/EarlyPauseAppUtils;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->unSetPauseAdvance()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
