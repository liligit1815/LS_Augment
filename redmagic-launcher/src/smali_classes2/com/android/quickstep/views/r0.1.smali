.class public final synthetic Lcom/android/quickstep/views/r0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/BiConsumer;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/views/RecentsView;

.field public final synthetic b:I

.field public final synthetic c:I

.field public final synthetic d:I

.field public final synthetic e:I

.field public final synthetic f:Ljava/util/List;

.field public final synthetic g:I


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/views/RecentsView;IIIILjava/util/List;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/views/r0;->a:Lcom/android/quickstep/views/RecentsView;

    .line 5
    .line 6
    iput p2, p0, Lcom/android/quickstep/views/r0;->b:I

    .line 7
    .line 8
    iput p3, p0, Lcom/android/quickstep/views/r0;->c:I

    .line 9
    .line 10
    iput p4, p0, Lcom/android/quickstep/views/r0;->d:I

    .line 11
    .line 12
    iput p5, p0, Lcom/android/quickstep/views/r0;->e:I

    .line 13
    .line 14
    iput-object p6, p0, Lcom/android/quickstep/views/r0;->f:Ljava/util/List;

    .line 15
    .line 16
    iput p7, p0, Lcom/android/quickstep/views/r0;->g:I

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/r0;->a:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/views/r0;->b:I

    .line 4
    .line 5
    iget v2, p0, Lcom/android/quickstep/views/r0;->c:I

    .line 6
    .line 7
    iget v3, p0, Lcom/android/quickstep/views/r0;->d:I

    .line 8
    .line 9
    iget v4, p0, Lcom/android/quickstep/views/r0;->e:I

    .line 10
    .line 11
    iget-object v5, p0, Lcom/android/quickstep/views/r0;->f:Ljava/util/List;

    .line 12
    .line 13
    iget v6, p0, Lcom/android/quickstep/views/r0;->g:I

    .line 14
    .line 15
    move-object v7, p1

    .line 16
    check-cast v7, Ljava/lang/Integer;

    .line 17
    .line 18
    move-object v8, p2

    .line 19
    check-cast v8, Lcom/android/quickstep/views/TaskView;

    .line 20
    .line 21
    invoke-static/range {v0 .. v8}, Lcom/android/quickstep/views/RecentsView;->J0(Lcom/android/quickstep/views/RecentsView;IIIILjava/util/List;ILjava/lang/Integer;Lcom/android/quickstep/views/TaskView;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
