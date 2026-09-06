.class public final synthetic Lcom/android/launcher3/util/Q;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/util/Z;

.field public final synthetic h:Lcom/android/launcher3/util/Z$d;

.field public final synthetic i:Lcom/android/launcher3/util/Z$c;

.field public final synthetic j:I

.field public final synthetic k:I


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/util/Z;Lcom/android/launcher3/util/Z$d;Lcom/android/launcher3/util/Z$c;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/util/Q;->g:Lcom/android/launcher3/util/Z;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/util/Q;->h:Lcom/android/launcher3/util/Z$d;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/util/Q;->i:Lcom/android/launcher3/util/Z$c;

    .line 9
    .line 10
    iput p4, p0, Lcom/android/launcher3/util/Q;->j:I

    .line 11
    .line 12
    iput p5, p0, Lcom/android/launcher3/util/Q;->k:I

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/Q;->g:Lcom/android/launcher3/util/Z;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/util/Q;->h:Lcom/android/launcher3/util/Z$d;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/util/Q;->i:Lcom/android/launcher3/util/Z$c;

    .line 6
    .line 7
    iget v3, p0, Lcom/android/launcher3/util/Q;->j:I

    .line 8
    .line 9
    iget p0, p0, Lcom/android/launcher3/util/Q;->k:I

    .line 10
    .line 11
    invoke-static {v0, v1, v2, v3, p0}, Lcom/android/launcher3/util/Z;->f(Lcom/android/launcher3/util/Z;Lcom/android/launcher3/util/Z$d;Lcom/android/launcher3/util/Z$c;II)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
