.class public final synthetic LO0/s;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:LO0/t;

.field public final synthetic h:Lcom/android/launcher3/model/data/I;

.field public final synthetic i:I

.field public final synthetic j:[I


# direct methods
.method public synthetic constructor <init>(LO0/t;Lcom/android/launcher3/model/data/I;I[I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LO0/s;->g:LO0/t;

    .line 5
    .line 6
    iput-object p2, p0, LO0/s;->h:Lcom/android/launcher3/model/data/I;

    .line 7
    .line 8
    iput p3, p0, LO0/s;->i:I

    .line 9
    .line 10
    iput-object p4, p0, LO0/s;->j:[I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, LO0/s;->g:LO0/t;

    .line 2
    .line 3
    iget-object v1, p0, LO0/s;->h:Lcom/android/launcher3/model/data/I;

    .line 4
    .line 5
    iget v2, p0, LO0/s;->i:I

    .line 6
    .line 7
    iget-object p0, p0, LO0/s;->j:[I

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0}, LO0/t;->R(LO0/t;Lcom/android/launcher3/model/data/I;I[I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
