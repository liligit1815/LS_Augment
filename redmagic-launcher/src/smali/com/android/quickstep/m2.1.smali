.class public final synthetic Lcom/android/quickstep/m2;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Ljava/util/function/Consumer;

.field public final synthetic h:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Ljava/util/function/Consumer;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/m2;->g:Ljava/util/function/Consumer;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/m2;->h:Ljava/util/ArrayList;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/m2;->g:Ljava/util/function/Consumer;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/m2;->h:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/android/quickstep/RecentTasksList;->k(Ljava/util/function/Consumer;Ljava/util/ArrayList;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
