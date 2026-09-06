.class public final synthetic Lcom/android/quickstep/fallback/e;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/IntPredicate;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/util/GroupTask;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/util/GroupTask;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/fallback/e;->a:Lcom/android/quickstep/util/GroupTask;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final test(I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/fallback/e;->a:Lcom/android/quickstep/util/GroupTask;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/GroupTask;->containsTask(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
