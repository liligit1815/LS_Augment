.class public final synthetic Lcom/android/launcher3/util/v2;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/util/x2;

.field public final synthetic h:Ljava/lang/Runnable;

.field public final synthetic i:Ljava/lang/String;

.field public final synthetic j:I

.field public final synthetic k:[Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/util/x2;Ljava/lang/Runnable;Ljava/lang/String;I[Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/util/v2;->g:Lcom/android/launcher3/util/x2;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/util/v2;->h:Ljava/lang/Runnable;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/util/v2;->i:Ljava/lang/String;

    .line 9
    .line 10
    iput p4, p0, Lcom/android/launcher3/util/v2;->j:I

    .line 11
    .line 12
    iput-object p5, p0, Lcom/android/launcher3/util/v2;->k:[Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/v2;->g:Lcom/android/launcher3/util/x2;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/util/v2;->h:Ljava/lang/Runnable;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/util/v2;->i:Ljava/lang/String;

    .line 6
    .line 7
    iget v3, p0, Lcom/android/launcher3/util/v2;->j:I

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/util/v2;->k:[Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0, v1, v2, v3, p0}, Lcom/android/launcher3/util/x2;->c(Lcom/android/launcher3/util/x2;Ljava/lang/Runnable;Ljava/lang/String;I[Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
