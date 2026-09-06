.class public final synthetic Lcom/android/quickstep/n2;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/RecentTasksList;

.field public final synthetic h:I

.field public final synthetic i:Z

.field public final synthetic j:Ljava/util/function/Consumer;

.field public final synthetic k:Ljava/util/function/Predicate;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/RecentTasksList;IZLjava/util/function/Consumer;Ljava/util/function/Predicate;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/n2;->g:Lcom/android/quickstep/RecentTasksList;

    .line 5
    .line 6
    iput p2, p0, Lcom/android/quickstep/n2;->h:I

    .line 7
    .line 8
    iput-boolean p3, p0, Lcom/android/quickstep/n2;->i:Z

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/quickstep/n2;->j:Ljava/util/function/Consumer;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/android/quickstep/n2;->k:Ljava/util/function/Predicate;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/n2;->g:Lcom/android/quickstep/RecentTasksList;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/n2;->h:I

    .line 4
    .line 5
    iget-boolean v2, p0, Lcom/android/quickstep/n2;->i:Z

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/quickstep/n2;->j:Ljava/util/function/Consumer;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/n2;->k:Ljava/util/function/Predicate;

    .line 10
    .line 11
    invoke-static {v0, v1, v2, v3, p0}, Lcom/android/quickstep/RecentTasksList;->g(Lcom/android/quickstep/RecentTasksList;IZLjava/util/function/Consumer;Ljava/util/function/Predicate;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
