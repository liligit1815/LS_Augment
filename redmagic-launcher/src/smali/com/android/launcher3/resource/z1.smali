.class public final synthetic Lcom/android/launcher3/resource/z1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:I

.field public final synthetic h:Ljava/lang/String;

.field public final synthetic i:Landroid/content/Context;

.field public final synthetic j:I


# direct methods
.method public synthetic constructor <init>(ILjava/lang/String;Landroid/content/Context;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/android/launcher3/resource/z1;->g:I

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/resource/z1;->h:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/resource/z1;->i:Landroid/content/Context;

    .line 9
    .line 10
    iput p4, p0, Lcom/android/launcher3/resource/z1;->j:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/android/launcher3/resource/z1;->g:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/resource/z1;->h:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/resource/z1;->i:Landroid/content/Context;

    .line 6
    .line 7
    iget p0, p0, Lcom/android/launcher3/resource/z1;->j:I

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0}, Lcom/android/launcher3/resource/UnReadInfoProvider;->d(ILjava/lang/String;Landroid/content/Context;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
