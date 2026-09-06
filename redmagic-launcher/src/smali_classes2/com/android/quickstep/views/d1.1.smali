.class public final synthetic Lcom/android/quickstep/views/d1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/BiConsumer;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/views/RecentsView;

.field public final synthetic b:Z

.field public final synthetic c:[I

.field public final synthetic d:I

.field public final synthetic e:[I


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/views/RecentsView;Z[II[I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/views/d1;->a:Lcom/android/quickstep/views/RecentsView;

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/android/quickstep/views/d1;->b:Z

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/views/d1;->c:[I

    .line 9
    .line 10
    iput p4, p0, Lcom/android/quickstep/views/d1;->d:I

    .line 11
    .line 12
    iput-object p5, p0, Lcom/android/quickstep/views/d1;->e:[I

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/d1;->a:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/quickstep/views/d1;->b:Z

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/quickstep/views/d1;->c:[I

    .line 6
    .line 7
    iget v3, p0, Lcom/android/quickstep/views/d1;->d:I

    .line 8
    .line 9
    iget-object v4, p0, Lcom/android/quickstep/views/d1;->e:[I

    .line 10
    .line 11
    move-object v5, p1

    .line 12
    check-cast v5, Ljava/lang/Integer;

    .line 13
    .line 14
    move-object v6, p2

    .line 15
    check-cast v6, Lcom/android/quickstep/views/TaskView;

    .line 16
    .line 17
    invoke-static/range {v0 .. v6}, Lcom/android/quickstep/views/RecentsView;->f1(Lcom/android/quickstep/views/RecentsView;Z[II[ILjava/lang/Integer;Lcom/android/quickstep/views/TaskView;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
