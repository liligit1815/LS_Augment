.class public final synthetic Lcom/android/launcher3/util/a1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Landroid/content/ContentResolver;

.field public final synthetic b:[B

.field public final synthetic c:Lcom/android/launcher3/D3;


# direct methods
.method public synthetic constructor <init>(Landroid/content/ContentResolver;[BLcom/android/launcher3/D3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/util/a1;->a:Landroid/content/ContentResolver;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/util/a1;->b:[B

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/util/a1;->c:Lcom/android/launcher3/D3;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/a1;->a:Landroid/content/ContentResolver;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/util/a1;->b:[B

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/util/a1;->c:Lcom/android/launcher3/D3;

    .line 6
    .line 7
    check-cast p1, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-static {v0, v1, p0, p1}, Lcom/android/launcher3/util/g1;->e(Landroid/content/ContentResolver;[BLcom/android/launcher3/D3;Ljava/lang/Integer;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
