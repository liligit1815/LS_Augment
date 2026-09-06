.class public final synthetic Lcom/android/quickstep/views/d0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/views/RecentsView;

.field public final synthetic h:I

.field public final synthetic i:Z

.field public final synthetic j:[I


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/views/RecentsView;IZ[I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/views/d0;->g:Lcom/android/quickstep/views/RecentsView;

    .line 5
    .line 6
    iput p2, p0, Lcom/android/quickstep/views/d0;->h:I

    .line 7
    .line 8
    iput-boolean p3, p0, Lcom/android/quickstep/views/d0;->i:Z

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/quickstep/views/d0;->j:[I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/d0;->g:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/views/d0;->h:I

    .line 4
    .line 5
    iget-boolean v2, p0, Lcom/android/quickstep/views/d0;->i:Z

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/quickstep/views/d0;->j:[I

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0}, Lcom/android/quickstep/views/RecentsView;->j1(Lcom/android/quickstep/views/RecentsView;IZ[I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
