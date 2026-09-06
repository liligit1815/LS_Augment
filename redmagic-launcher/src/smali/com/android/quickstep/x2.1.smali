.class public final synthetic Lcom/android/quickstep/x2;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/RecentTasksList;

.field public final synthetic h:I

.field public final synthetic i:Ljava/util/function/Consumer;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/RecentTasksList;ILjava/util/function/Consumer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/x2;->g:Lcom/android/quickstep/RecentTasksList;

    .line 5
    .line 6
    iput p2, p0, Lcom/android/quickstep/x2;->h:I

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/x2;->i:Ljava/util/function/Consumer;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/x2;->g:Lcom/android/quickstep/RecentTasksList;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/x2;->h:I

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/x2;->i:Ljava/util/function/Consumer;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/android/quickstep/RecentTasksList;->j(Lcom/android/quickstep/RecentTasksList;ILjava/util/function/Consumer;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
