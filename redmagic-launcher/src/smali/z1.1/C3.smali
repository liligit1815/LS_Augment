.class public final synthetic Lz1/C3;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lz1/J3;

.field public final synthetic h:Lcom/android/launcher3/model/data/y;

.field public final synthetic i:[Ljava/lang/StackTraceElement;

.field public final synthetic j:Lz1/J3$d;


# direct methods
.method public synthetic constructor <init>(Lz1/J3;Lcom/android/launcher3/model/data/y;[Ljava/lang/StackTraceElement;Lz1/J3$d;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/C3;->g:Lz1/J3;

    .line 5
    .line 6
    iput-object p2, p0, Lz1/C3;->h:Lcom/android/launcher3/model/data/y;

    .line 7
    .line 8
    iput-object p3, p0, Lz1/C3;->i:[Ljava/lang/StackTraceElement;

    .line 9
    .line 10
    iput-object p4, p0, Lz1/C3;->j:Lz1/J3$d;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lz1/C3;->g:Lz1/J3;

    .line 2
    .line 3
    iget-object v1, p0, Lz1/C3;->h:Lcom/android/launcher3/model/data/y;

    .line 4
    .line 5
    iget-object v2, p0, Lz1/C3;->i:[Ljava/lang/StackTraceElement;

    .line 6
    .line 7
    iget-object p0, p0, Lz1/C3;->j:Lz1/J3$d;

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0}, Lz1/J3;->h(Lz1/J3;Lcom/android/launcher3/model/data/y;[Ljava/lang/StackTraceElement;Lz1/J3$d;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
