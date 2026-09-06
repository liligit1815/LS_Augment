.class public final synthetic Lcom/android/launcher3/touch/u;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/C2;

.field public final synthetic h:Ljava/lang/String;

.field public final synthetic i:Lcom/android/launcher3/model/data/y;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/C2;Ljava/lang/String;Lcom/android/launcher3/model/data/y;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/touch/u;->g:Lcom/android/launcher3/C2;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/touch/u;->h:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/touch/u;->i:Lcom/android/launcher3/model/data/y;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/touch/u;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/touch/u;->h:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/touch/u;->i:Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    invoke-static {v0, v1, p0, p1, p2}, Lcom/android/launcher3/touch/v;->i(Lcom/android/launcher3/C2;Ljava/lang/String;Lcom/android/launcher3/model/data/y;Landroid/content/DialogInterface;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
